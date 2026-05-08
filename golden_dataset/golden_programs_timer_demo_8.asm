; DESCRIPTION: Geometry OS program to draw a colored object.

; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r0

; --- Part 2: TMR_WAIT 200ms ---
IMM r15, 200
TMR_WAIT r15

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r1
SUB r8, r1, r0

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r8/10, 30), color=4 (blue)
DIV r11, r8, 10
IMM r3, 30
CMP r11, r3
JGE r11, r3, cap_height
JMP draw_bar
cap_height:
MOV r11, r3
draw_bar:
IMM r5, 2       ; x
IMM r13, 0      ; y
bar_loop:
CMP r11, 0
JEQ r11, 0, bar_done
PXL r5, r13, 4
INC r13
DEC r11
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
IMM r7, 100    ; delay ms
IMM r12, 0xF00  ; RAM address
IMM r9, 99     ; value to write
ALARM_SET r7, r12, r9

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LOAD r10, 0xF00
CMP r10, 99
JNE r10, 99, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
IMM r6, 5      ; x
IMM r16, 20     ; y (bottom area)
PXL r6, r16, 2 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
AND r20, r8, 0xF
IMM r21, 8      ; start x for dots
IMM r22, 20     ; y (same row as alarm marker)
dot_loop:
CMP r20, 0
JEQ r20, 0, dots_done
PXL r21, r22, 12 ; bright red dots
INC r21
DEC r20
JMP dot_loop
dots_done:

; --- Part 9: Clear the alarm slot ---
IMM r17, 0
ALARM_CLR r17

FRAME
HALT
