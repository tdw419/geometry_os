; DESCRIPTION: A colored object centered at the screen with fixed size.

; netmon.asm -- Phase 141: Network Packet Viewer
;
; Visual network packet monitor. Reads from /dev/net device,
; displays scrolling packet log with hex data and rate stats.
; Simulates traffic by writing random data to the net port.
;
; Layout:
;   Row 0-1: Title bar
;   Row 2-29: Scrolling packet log (colored bars per packet)
;   Row 30-31: Status bar with packet count and rate
;
; Opcodes: LDI, MOV, ADD, SUB, MUL, DIV, AND, OR, SHL, SHR, SAR
;          MOD, CMP, JZ, JNZ, BLT, BGE, JMP, FILL, RECTF, PSET
;          DRAWTEXT, TEXT, IKEY, RAND, FRAME, OPEN, READ, IOCTL
;          STORE, LOAD

; == INIT ==
    LDI r2, 1
    LDI r4, 0
    LDI r3, 0             ; total packets
    LDI r12, 0            ; rate counter
    LDI r15, 0            ; displayed rate
    LDI r0, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r7, net_path
    LDI r8, 0
    OPEN r7, r8
    MOV r5, r11            ; r5 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r7, 0x080810
    FILL r7

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r7, 0xFFE
    LOAD r7, r7
    LDI r8, 31
    AND r7, r8
    LDI r8, 15
    CMP r7, r8
    JNZ r11, no_sim
    RAND r7
    LDI r8, 0xFFC
    STORE r8, r7
no_sim:

    ; == READ FROM /dev/net ==
    LDI r7, 0xFFC
    LDI r8, 1
    READ r5, r7, r8
    LDI r7, 0
    CMP r11, r7
    JZ r11, no_pkt

    ; Store packet
    LDI r7, 0xFFC
    LOAD r24, r7           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r7, r0
    LDI r8, 2
    SHL r7, r8
    MOV r8, r22
    ADD r8, r7
    STORE r8, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r7, r2
    ADD r8, r7
    MOV r9, r24
    LDI r14, 24
    SHR r9, r14             ; top byte
    STORE r8, r9

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r7, r2
    ADD r8, r7
    LDI r9, 0xFFE
    LOAD r9, r9
    STORE r8, r9

    ; Advance head
    ADD r0, r2
    LDI r7, 32
    CMP r0, r7
    BLT r11, no_wrap
    LDI r0, 0
no_wrap:
    ADD r3, r2
    ADD r12, r2

no_pkt:
    ; == RATE UPDATE ==
    LDI r7, 0xFFE
    LOAD r10, r7
    LDI r7, 63
    AND r10, r7
    LDI r7, 2
    CMP r10, r7
    BGE r11, no_rate
    MOV r15, r12
    LDI r12, 0
no_rate:

    ; == TITLE BAR ==
    LDI r7, 0
    LDI r8, 0
    LDI r9, 256
    LDI r14, 14
    LDI r1, 0x003366
    RECTF r7, r8, r9, r14, r1

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r7, 0xE003
    LDI r8, 0
    LDI r9, 0
    IOCTL r7, r8, r9
    LDI r7, 0
    CMP r11, r7
    JZ r11, net_down_label

    ; Net status indicator
    LDI r16, 90
    LDI r17, 3
    LDI r18, up_str
    LDI r19, 0x00FF00
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20
    JMP pkt_draw

net_down_label:
    LDI r16, 90
    LDI r17, 3
    LDI r18, down_str
    LDI r19, 0xFF0000
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

pkt_draw:
    ; == DRAW PACKET LOG ==
    ; Show last 28 packets as colored bars
    LDI r25, 0             ; display row (0-27)
    LDI r17, 16            ; start y

pkt_row:
    LDI r7, 0
    CMP r3, r7
    JZ r11, show_empty

    ; Determine entry index
    LDI r7, 28
    CMP r3, r7
    BGE r11, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r3
    BLT r11, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r7, r0
    LDI r8, 28
    SUB r7, r8
    ADD r7, r25
    LDI r8, 31
    AND r7, r8

do_draw_entry:
    ; r7 = entry index
    LDI r8, 2
    SHL r7, r8             ; entry * 4
    MOV r9, r22
    ADD r9, r7             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r8, r9
    ADD r8, r2
    LOAD r1, r8           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r14, 0xE0
    AND r1, r14            ; top 3 bits
    LDI r14, 5
    SHR r1, r14            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r14, 0x44
    OR r1, r14             ; ensure minimum brightness

    ; Draw row bar
    LDI r7, 2
    LDI r8, 256
    LDI r14, 7
    RECTF r7, r17, r8, r14, r1

    ; Draw a bright accent line on left
    MOV r7, r9
    LOAD r13, r7           ; data word
    LDI r10, 16
    SHR r13, r10
    LDI r10, 0xF
    AND r13, r10
    LDI r10, 2
    MUL r13, r10
    ADD r13, r2             ; width = 3..33
    LDI r10, 0x00CCFF      ; cyan accent
    RECTF r7, r17, r13, r14, r10

skip_row:
    LDI r7, 8
    ADD r17, r7
    ADD r25, r2
    LDI r7, 28
    CMP r25, r7
    BLT r11, pkt_row
    JMP draw_stat

show_empty:
    LDI r16, 80
    LDI r17, 130
    LDI r18, empty_str
    LDI r19, 0x555555
    LDI r20, 0
    DRAWTEXT r16, r17, r18, r19, r20

draw_stat:
    ; == STATUS BAR ==
    LDI r7, 0
    LDI r8, 242
    LDI r9, 256
    LDI r14, 14
    LDI r1, 0x002244
    RECTF r7, r8, r9, r14, r1

    ; Build "PKT:N" at 0x6000
    LDI r7, 0x6000
    LDI r1, 80            ; 'P'
    STORE r7, r1
    ADD r7, r2
    LDI r1, 75
    STORE r7, r1
    ADD r7, r2
    LDI r1, 84
    STORE r7, r1
    ADD r7, r2
    LDI r1, 58
    STORE r7, r1
    ADD r7, r2
    LDI r1, 32
    STORE r7, r1
    ADD r7, r2

    ; Decimal convert r3
    MOV r8, r3
    LDI r9, 0x6020
    LDI r1, 0
    STORE r9, r1
    ; Special case: if r3 == 0, write '0'
    LDI r1, 0
    CMP r8, r1
    JNZ r11, dec_nonzero
    LDI r1, 48
    SUB r9, r2
    STORE r9, r1
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r8
    DIV r28, r27
    MUL r28, r27
    MOV r29, r8
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r9, r2
    STORE r9, r29
    LDI r28, 10
    DIV r8, r28
    LDI r28, 0
    CMP r8, r28
    JNZ r11, dec_nonzero
dec_copy:
    LDI r7, 0x6005
dec_cp:
    LOAD r8, r9
    LDI r27, 0
    CMP r8, r27
    JZ r11, dec_cp_done
    STORE r7, r8
    ADD r7, r2
    ADD r9, r2
    JMP dec_cp
dec_cp_done:
    LDI r1, 0
    STORE r7, r1

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r7, 0x6030
    LDI r1, 82
    STORE r7, r1
    ADD r7, r2
    LDI r1, 65
    STORE r7, r1
    ADD r7, r2
    LDI r1, 84
    STORE r7, r1
    ADD r7, r2
    LDI r1, 69
    STORE r7, r1
    ADD r7, r2
    LDI r1, 58
    STORE r7, r1
    ADD r7, r2
    LDI r1, 32
    STORE r7, r1
    ADD r7, r2

    ; Decimal convert r15
    MOV r8, r15
    LDI r9, 0x6050
    LDI r1, 0
    STORE r9, r1
    LDI r1, 0
    CMP r8, r1
    JNZ r11, rdec_nonzero
    LDI r1, 48
    SUB r9, r2
    STORE r9, r1
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r8
    DIV r28, r27
    MUL r28, r27
    MOV r29, r8
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r9, r2
    STORE r9, r29
    LDI r28, 10
    DIV r8, r28
    LDI r28, 0
    CMP r8, r28
    JNZ r11, rdec_nonzero
rdec_copy:
    LDI r7, 0x6037
rdec_cp:
    LOAD r8, r9
    LDI r27, 0
    CMP r8, r27
    JZ r11, rdec_done
    STORE r7, r8
    ADD r7, r2
    ADD r9, r2
    JMP rdec_cp
rdec_done:
    LDI r1, 47
    STORE r7, r1
    ADD r7, r2
    LDI r1, 115
    STORE r7, r1
    ADD r7, r2
    LDI r1, 0
    STORE r7, r1

    LDI r16, 130
    LDI r17, 244
    LDI r18, 0x6030
    LDI r19, 0xFFFF00
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    FRAME
    JMP main_loop

; == DATA ==
.org 0x4000
net_path:
    .asciz "/dev/net"
    .db 0

title_str:
    .asciz "NETMON - Packet Viewer"
    .db 0

up_str:
    .asciz "UP"
    .db 0

down_str:
    .asciz "DOWN"
    .db 0

empty_str:
    .asciz "NO PACKETS YET"
    .db 0
