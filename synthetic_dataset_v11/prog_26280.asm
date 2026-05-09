; DESCRIPTION: Draws a black rectangle at (26, 128) with width 73 and height 79.
; PLAN: r0=26(x), r1=128(y), r2=73(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 128
LDI r2, 73
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
