; DESCRIPTION: Draws a purple rectangle at (175, 36) with width 91 and height 55.
; PLAN: r0=175(x), r1=36(y), r2=91(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 36
LDI r2, 91
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
