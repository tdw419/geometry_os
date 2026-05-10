; DESCRIPTION: Draws a black rectangle at (179, 13) with width 107 and height 19.
; PLAN: r0=179(x), r1=13(y), r2=107(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 13
LDI r2, 107
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
