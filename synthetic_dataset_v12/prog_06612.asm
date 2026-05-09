; DESCRIPTION: Draws a cyan rectangle at (157, 91) with width 97 and height 33.
; PLAN: r0=157(x), r1=91(y), r2=97(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 91
LDI r2, 97
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
