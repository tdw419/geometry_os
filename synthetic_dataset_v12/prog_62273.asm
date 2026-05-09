; DESCRIPTION: Draws a green rectangle at (351, 128) with width 47 and height 46.
; PLAN: r0=351(x), r1=128(y), r2=47(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 128
LDI r2, 47
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
