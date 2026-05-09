; DESCRIPTION: Draws a black rectangle at (330, 147) with width 28 and height 76.
; PLAN: r0=330(x), r1=147(y), r2=28(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 147
LDI r2, 28
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
