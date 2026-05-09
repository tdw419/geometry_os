; DESCRIPTION: Draws a yellow rectangle at (189, 164) with width 12 and height 81.
; PLAN: r0=189(x), r1=164(y), r2=12(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 164
LDI r2, 12
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
