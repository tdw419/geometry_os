; DESCRIPTION: Draws a purple rectangle at (117, 55) with width 80 and height 23.
; PLAN: r0=117(x), r1=55(y), r2=80(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 55
LDI r2, 80
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
