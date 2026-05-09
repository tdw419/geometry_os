; DESCRIPTION: Draws a black rectangle at (12, 112) with width 22 and height 58.
; PLAN: r0=12(x), r1=112(y), r2=22(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 112
LDI r2, 22
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
