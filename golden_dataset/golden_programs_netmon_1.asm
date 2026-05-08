; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
    LDI r13, 1
    LDI r14, 0
    LDI r0, 0             ; total packets
    LDI r8, 0            ; rate counter
    LDI r3, 0            ; displayed rate
    LDI r12, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r6, net_path
    LDI r1, 0
    OPEN r6, r1
    MOV r5, r11            ; r5 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r6, 0x080810
    FILL r6

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r6, 0xFFE
    LOAD r6, r6
    LDI r1, 31
    AND r6, r1
    LDI r1, 15
    CMP r6, r1
    JNZ r11, no_sim
    RAND r6
    LDI r1, 0xFFC
    STORE r1, r6
no_sim:

    ; == READ FROM /dev/net ==
    LDI r6, 0xFFC
    LDI r1, 1
    READ r5, r6, r1
    LDI r6, 0
    CMP r11, r6
    JZ r11, no_pkt

    ; Store packet
    LDI r6, 0xFFC
    LOAD r24, r6           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r6, r12
    LDI r1, 2
    SHL r6, r1
    MOV r1, r22
    ADD r1, r6
    STORE r1, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r6, r13
    ADD r1, r6
    MOV r15, r24
    LDI r9, 24
    SHR r15, r9             ; top byte
    STORE r1, r15

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r6, r13
    ADD r1, r6
    LDI r15, 0xFFE
    LOAD r15, r15
    STORE r1, r15

    ; Advance head
    ADD r12, r13
    LDI r6, 32
    CMP r12, r6
    BLT r11, no_wrap
    LDI r12, 0
no_wrap:
    ADD r0, r13
    ADD r8, r13

no_pkt:
    ; == RATE UPDATE ==
    LDI r6, 0xFFE
    LOAD r7, r6
    LDI r6, 63
    AND r7, r6
    LDI r6, 2
    CMP r7, r6
    BGE r11, no_rate
    MOV r3, r8
    LDI r8, 0
no_rate:

    ; == TITLE BAR ==
    LDI r6, 0
    LDI r1, 0
    LDI r15, 256
    LDI r9, 14
    LDI r2, 0x003366
    RECTF r6, r1, r15, r9, r2

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r6, 0xE003
    LDI r1, 0
    LDI r15, 0
    IOCTL r6, r1, r15
    LDI r6, 0
    CMP r11, r6
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
    LDI r6, 0
    CMP r0, r6
    JZ r11, show_empty

    ; Determine entry index
    LDI r6, 28
    CMP r0, r6
    BGE r11, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r0
    BLT r11, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r6, r12
    LDI r1, 28
    SUB r6, r1
    ADD r6, r25
    LDI r1, 31
    AND r6, r1

do_draw_entry:
    ; r6 = entry index
    LDI r1, 2
    SHL r6, r1             ; entry * 4
    MOV r15, r22
    ADD r15, r6             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r1, r15
    ADD r1, r13
    LOAD r2, r1           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r9, 0xE0
    AND r2, r9            ; top 3 bits
    LDI r9, 5
    SHR r2, r9            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r9, 0x44
    OR r2, r9             ; ensure minimum brightness

    ; Draw row bar
    LDI r6, 2
    LDI r1, 256
    LDI r9, 7
    RECTF r6, r17, r1, r9, r2

    ; Draw a bright accent line on left
    MOV r6, r15
    LOAD r10, r6           ; data word
    LDI r7, 16
    SHR r10, r7
    LDI r7, 0xF
    AND r10, r7
    LDI r7, 2
    MUL r10, r7
    ADD r10, r13             ; width = 3..33
    LDI r7, 0x00CCFF      ; cyan accent
    RECTF r6, r17, r10, r9, r7

skip_row:
    LDI r6, 8
    ADD r17, r6
    ADD r25, r13
    LDI r6, 28
    CMP r25, r6
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
    LDI r6, 0
    LDI r1, 242
    LDI r15, 256
    LDI r9, 14
    LDI r2, 0x002244
    RECTF r6, r1, r15, r9, r2

    ; Build "PKT:N" at 0x6000
    LDI r6, 0x6000
    LDI r2, 80            ; 'P'
    STORE r6, r2
    ADD r6, r13
    LDI r2, 75
    STORE r6, r2
    ADD r6, r13
    LDI r2, 84
    STORE r6, r2
    ADD r6, r13
    LDI r2, 58
    STORE r6, r2
    ADD r6, r13
    LDI r2, 32
    STORE r6, r2
    ADD r6, r13

    ; Decimal convert r0
    MOV r1, r0
    LDI r15, 0x6020
    LDI r2, 0
    STORE r15, r2
    ; Special case: if r0 == 0, write '0'
    LDI r2, 0
    CMP r1, r2
    JNZ r11, dec_nonzero
    LDI r2, 48
    SUB r15, r13
    STORE r15, r2
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r1
    DIV r28, r27
    MUL r28, r27
    MOV r29, r1
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r15, r13
    STORE r15, r29
    LDI r28, 10
    DIV r1, r28
    LDI r28, 0
    CMP r1, r28
    JNZ r11, dec_nonzero
dec_copy:
    LDI r6, 0x6005
dec_cp:
    LOAD r1, r15
    LDI r27, 0
    CMP r1, r27
    JZ r11, dec_cp_done
    STORE r6, r1
    ADD r6, r13
    ADD r15, r13
    JMP dec_cp
dec_cp_done:
    LDI r2, 0
    STORE r6, r2

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r6, 0x6030
    LDI r2, 82
    STORE r6, r2
    ADD r6, r13
    LDI r2, 65
    STORE r6, r2
    ADD r6, r13
    LDI r2, 84
    STORE r6, r2
    ADD r6, r13
    LDI r2, 69
    STORE r6, r2
    ADD r6, r13
    LDI r2, 58
    STORE r6, r2
    ADD r6, r13
    LDI r2, 32
    STORE r6, r2
    ADD r6, r13

    ; Decimal convert r3
    MOV r1, r3
    LDI r15, 0x6050
    LDI r2, 0
    STORE r15, r2
    LDI r2, 0
    CMP r1, r2
    JNZ r11, rdec_nonzero
    LDI r2, 48
    SUB r15, r13
    STORE r15, r2
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r1
    DIV r28, r27
    MUL r28, r27
    MOV r29, r1
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r15, r13
    STORE r15, r29
    LDI r28, 10
    DIV r1, r28
    LDI r28, 0
    CMP r1, r28
    JNZ r11, rdec_nonzero
rdec_copy:
    LDI r6, 0x6037
rdec_cp:
    LOAD r1, r15
    LDI r27, 0
    CMP r1, r27
    JZ r11, rdec_done
    STORE r6, r1
    ADD r6, r13
    ADD r15, r13
    JMP rdec_cp
rdec_done:
    LDI r2, 47
    STORE r6, r2
    ADD r6, r13
    LDI r2, 115
    STORE r6, r2
    ADD r6, r13
    LDI r2, 0
    STORE r6, r2

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
