; DESCRIPTION: Draws a black rectangle at (297, 125) with width 26 and height 87.
; PLAN: r0=297(x), r1=125(y), r2=26(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 125
LDI r2, 26
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
