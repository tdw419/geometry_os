; DESCRIPTION: Draws a yellow rectangle at (73, 6) with width 40 and height 12.
; PLAN: r0=73(x), r1=6(y), r2=40(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 6
LDI r2, 40
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
