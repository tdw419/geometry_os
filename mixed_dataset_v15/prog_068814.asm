; DESCRIPTION: Draws a yellow rectangle at (156, 183) with width 38 and height 81.
; PLAN: r0=156(x), r1=183(y), r2=38(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 183
LDI r2, 38
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
