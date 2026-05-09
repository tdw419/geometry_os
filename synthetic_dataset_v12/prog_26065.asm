; DESCRIPTION: Draws a yellow rectangle at (144, 1) with width 93 and height 24.
; PLAN: r0=144(x), r1=1(y), r2=93(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 1
LDI r2, 93
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
