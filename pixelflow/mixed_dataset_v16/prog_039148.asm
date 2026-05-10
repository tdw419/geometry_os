; DESCRIPTION: Draws a cyan rectangle at (351, 98) with width 49 and height 97.
; PLAN: r0=351(x), r1=98(y), r2=49(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 98
LDI r2, 49
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
