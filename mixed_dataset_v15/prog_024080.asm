; DESCRIPTION: Draws a cyan rectangle at (409, 97) with width 43 and height 85.
; PLAN: r0=409(x), r1=97(y), r2=43(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 97
LDI r2, 43
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
