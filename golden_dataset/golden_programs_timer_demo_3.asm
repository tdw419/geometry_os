; DESCRIPTION: Render a colored object at the screen.

; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r2

; --- Part 2: TMR_WAIT 200ms ---
IMM r13, 200
TMR_WAIT r13

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r6
SUB r15, r6, r2

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r15/10, 30), color=4 (blue)
DIV r3, r15, 10
IMM r0, 30
CMP r3, r0
JGE r3, r0, cap_height
JMP draw_bar
cap_height:
MOV r3, r0
draw_bar:
IMM r7, 2       ; x
IMM r8, 0      ; y
bar_loop:
CMP r3, 0
JEQ r3, 0, bar_done
PXL r7, r8, 4
INC r8
DEC r3
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
IMM r4, 100    ; delay ms
IMM r10, 0xF00  ; RAM address
IMM r11, 99     ; value to write
ALARM_SET r4, r10, r11

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LOAD r5, 0xF00
CMP r5, 99
JNE r5, 99, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
IMM r14, 5      ; x
IMM r16, 20     ; y (bottom area)
PXL r14, r16, 2 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
AND r20, r15, 0xF
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
