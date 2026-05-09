; DESCRIPTION: Draws a purple rectangle at (136, 59) with width 38 and height 65.
; PLAN: r0=136(x), r1=59(y), r2=38(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 59
LDI r2, 38
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
