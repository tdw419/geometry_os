; DESCRIPTION: Draws a black rectangle at (36, 136) with width 58 and height 27.
; PLAN: r0=36(x), r1=136(y), r2=58(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 136
LDI r2, 58
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
