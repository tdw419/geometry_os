; DESCRIPTION: Draws a cyan rectangle at (364, 57) with width 97 and height 34.
; PLAN: r0=364(x), r1=57(y), r2=97(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 57
LDI r2, 97
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
