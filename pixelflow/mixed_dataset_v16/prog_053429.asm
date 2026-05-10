; DESCRIPTION: Draws a black rectangle at (260, 11) with width 58 and height 120.
; PLAN: r0=260(x), r1=11(y), r2=58(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 11
LDI r2, 58
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
