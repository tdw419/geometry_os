; DESCRIPTION: Draws a blue rectangle at (277, 202) with width 12 and height 10.
; PLAN: r0=277(x), r1=202(y), r2=12(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 202
LDI r2, 12
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
