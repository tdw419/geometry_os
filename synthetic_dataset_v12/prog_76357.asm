; DESCRIPTION: Draws a blue rectangle at (7, 81) with width 53 and height 99.
; PLAN: r0=7(x), r1=81(y), r2=53(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 81
LDI r2, 53
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
