; DESCRIPTION: Draws a yellow rectangle at (6, 62) with width 84 and height 93.
; PLAN: r0=6(x), r1=62(y), r2=84(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 62
LDI r2, 84
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
