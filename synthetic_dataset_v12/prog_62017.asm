; DESCRIPTION: Draws a black rectangle at (290, 76) with width 81 and height 38.
; PLAN: r0=290(x), r1=76(y), r2=81(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 76
LDI r2, 81
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
