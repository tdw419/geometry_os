; DESCRIPTION: Draws a black rectangle at (325, 71) with width 12 and height 35.
; PLAN: r0=325(x), r1=71(y), r2=12(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 71
LDI r2, 12
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
