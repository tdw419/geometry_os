; DESCRIPTION: Draws a blue rectangle at (277, 1) with width 78 and height 75.
; PLAN: r0=277(x), r1=1(y), r2=78(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 1
LDI r2, 78
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
