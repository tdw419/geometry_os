; DESCRIPTION: Draws a yellow rectangle at (192, 106) with width 74 and height 48.
; PLAN: r0=192(x), r1=106(y), r2=74(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 106
LDI r2, 74
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
