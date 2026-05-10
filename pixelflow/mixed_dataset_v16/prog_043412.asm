; DESCRIPTION: Draws a black rectangle at (273, 94) with width 58 and height 107.
; PLAN: r0=273(x), r1=94(y), r2=58(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 94
LDI r2, 58
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
