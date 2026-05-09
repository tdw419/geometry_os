; DESCRIPTION: Draws a black rectangle at (297, 79) with width 88 and height 87.
; PLAN: r0=297(x), r1=79(y), r2=88(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 79
LDI r2, 88
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
