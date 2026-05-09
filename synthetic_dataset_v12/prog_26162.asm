; DESCRIPTION: Draws a black rectangle at (351, 133) with width 86 and height 98.
; PLAN: r0=351(x), r1=133(y), r2=86(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 133
LDI r2, 86
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
