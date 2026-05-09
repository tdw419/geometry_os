; DESCRIPTION: Draws a cyan rectangle at (266, 97) with width 78 and height 76.
; PLAN: r0=266(x), r1=97(y), r2=78(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 97
LDI r2, 78
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
