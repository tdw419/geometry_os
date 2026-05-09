; DESCRIPTION: Draws a purple rectangle at (34, 6) with width 59 and height 36.
; PLAN: r0=34(x), r1=6(y), r2=59(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 6
LDI r2, 59
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
