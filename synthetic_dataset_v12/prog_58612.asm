; DESCRIPTION: Draws a cyan rectangle at (375, 169) with width 97 and height 12.
; PLAN: r0=375(x), r1=169(y), r2=97(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 169
LDI r2, 97
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
