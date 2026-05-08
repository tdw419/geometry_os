; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
    LDI r3, 1
    LDI r5, 0
    LDI r2, 0             ; total packets
    LDI r12, 0            ; rate counter
    LDI r0, 0            ; displayed rate
    LDI r1, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r4, net_path
    LDI r8, 0
    OPEN r4, r8
    MOV r9, r7            ; r9 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r4, 0x080810
    FILL r4

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r4, 0xFFE
    LOAD r4, r4
    LDI r8, 31
    AND r4, r8
    LDI r8, 15
    CMP r4, r8
    JNZ r7, no_sim
    RAND r4
    LDI r8, 0xFFC
    STORE r8, r4
no_sim:

    ; == READ FROM /dev/net ==
    LDI r4, 0xFFC
    LDI r8, 1
    READ r9, r4, r8
    LDI r4, 0
    CMP r7, r4
    JZ r7, no_pkt

    ; Store packet
    LDI r4, 0xFFC
    LOAD r24, r4           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r4, r1
    LDI r8, 2
    SHL r4, r8
    MOV r8, r22
    ADD r8, r4
    STORE r8, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r4, r3
    ADD r8, r4
    MOV r14, r24
    LDI r6, 24
    SHR r14, r6             ; top byte
    STORE r8, r14

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r4, r3
    ADD r8, r4
    LDI r14, 0xFFE
    LOAD r14, r14
    STORE r8, r14

    ; Advance head
    ADD r1, r3
    LDI r4, 32
    CMP r1, r4
    BLT r7, no_wrap
    LDI r1, 0
no_wrap:
    ADD r2, r3
    ADD r12, r3

no_pkt:
    ; == RATE UPDATE ==
    LDI r4, 0xFFE
    LOAD r15, r4
    LDI r4, 63
    AND r15, r4
    LDI r4, 2
    CMP r15, r4
    BGE r7, no_rate
    MOV r0, r12
    LDI r12, 0
no_rate:

    ; == TITLE BAR ==
    LDI r4, 0
    LDI r8, 0
    LDI r14, 256
    LDI r6, 14
    LDI r11, 0x003366
    RECTF r4, r8, r14, r6, r11

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r4, 0xE003
    LDI r8, 0
    LDI r14, 0
    IOCTL r4, r8, r14
    LDI r4, 0
    CMP r7, r4
    JZ r7, net_down_label

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
    LDI r4, 0
    CMP r2, r4
    JZ r7, show_empty

    ; Determine entry index
    LDI r4, 28
    CMP r2, r4
    BGE r7, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r2
    BLT r7, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r4, r1
    LDI r8, 28
    SUB r4, r8
    ADD r4, r25
    LDI r8, 31
    AND r4, r8

do_draw_entry:
    ; r4 = entry index
    LDI r8, 2
    SHL r4, r8             ; entry * 4
    MOV r14, r22
    ADD r14, r4             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r8, r14
    ADD r8, r3
    LOAD r11, r8           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r6, 0xE0
    AND r11, r6            ; top 3 bits
    LDI r6, 5
    SHR r11, r6            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r6, 0x44
    OR r11, r6             ; ensure minimum brightness

    ; Draw row bar
    LDI r4, 2
    LDI r8, 256
    LDI r6, 7
    RECTF r4, r17, r8, r6, r11

    ; Draw a bright accent line on left
    MOV r4, r14
    LOAD r10, r4           ; data word
    LDI r15, 16
    SHR r10, r15
    LDI r15, 0xF
    AND r10, r15
    LDI r15, 2
    MUL r10, r15
    ADD r10, r3             ; width = 3..33
    LDI r15, 0x00CCFF      ; cyan accent
    RECTF r4, r17, r10, r6, r15

skip_row:
    LDI r4, 8
    ADD r17, r4
    ADD r25, r3
    LDI r4, 28
    CMP r25, r4
    BLT r7, pkt_row
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
    LDI r4, 0
    LDI r8, 242
    LDI r14, 256
    LDI r6, 14
    LDI r11, 0x002244
    RECTF r4, r8, r14, r6, r11

    ; Build "PKT:N" at 0x6000
    LDI r4, 0x6000
    LDI r11, 80            ; 'P'
    STORE r4, r11
    ADD r4, r3
    LDI r11, 75
    STORE r4, r11
    ADD r4, r3
    LDI r11, 84
    STORE r4, r11
    ADD r4, r3
    LDI r11, 58
    STORE r4, r11
    ADD r4, r3
    LDI r11, 32
    STORE r4, r11
    ADD r4, r3

    ; Decimal convert r2
    MOV r8, r2
    LDI r14, 0x6020
    LDI r11, 0
    STORE r14, r11
    ; Special case: if r2 == 0, write '0'
    LDI r11, 0
    CMP r8, r11
    JNZ r7, dec_nonzero
    LDI r11, 48
    SUB r14, r3
    STORE r14, r11
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
    SUB r14, r3
    STORE r14, r29
    LDI r28, 10
    DIV r8, r28
    LDI r28, 0
    CMP r8, r28
    JNZ r7, dec_nonzero
dec_copy:
    LDI r4, 0x6005
dec_cp:
    LOAD r8, r14
    LDI r27, 0
    CMP r8, r27
    JZ r7, dec_cp_done
    STORE r4, r8
    ADD r4, r3
    ADD r14, r3
    JMP dec_cp
dec_cp_done:
    LDI r11, 0
    STORE r4, r11

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r4, 0x6030
    LDI r11, 82
    STORE r4, r11
    ADD r4, r3
    LDI r11, 65
    STORE r4, r11
    ADD r4, r3
    LDI r11, 84
    STORE r4, r11
    ADD r4, r3
    LDI r11, 69
    STORE r4, r11
    ADD r4, r3
    LDI r11, 58
    STORE r4, r11
    ADD r4, r3
    LDI r11, 32
    STORE r4, r11
    ADD r4, r3

    ; Decimal convert r0
    MOV r8, r0
    LDI r14, 0x6050
    LDI r11, 0
    STORE r14, r11
    LDI r11, 0
    CMP r8, r11
    JNZ r7, rdec_nonzero
    LDI r11, 48
    SUB r14, r3
    STORE r14, r11
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
    SUB r14, r3
    STORE r14, r29
    LDI r28, 10
    DIV r8, r28
    LDI r28, 0
    CMP r8, r28
    JNZ r7, rdec_nonzero
rdec_copy:
    LDI r4, 0x6037
rdec_cp:
    LOAD r8, r14
    LDI r27, 0
    CMP r8, r27
    JZ r7, rdec_done
    STORE r4, r8
    ADD r4, r3
    ADD r14, r3
    JMP rdec_cp
rdec_done:
    LDI r11, 47
    STORE r4, r11
    ADD r4, r3
    LDI r11, 115
    STORE r4, r11
    ADD r4, r3
    LDI r11, 0
    STORE r4, r11

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
