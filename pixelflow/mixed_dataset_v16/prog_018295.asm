; DESCRIPTION: Draws a cyan rectangle at (325, 91) with width 48 and height 94.
; PLAN: r0=325(x), r1=91(y), r2=48(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 91
LDI r2, 48
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
