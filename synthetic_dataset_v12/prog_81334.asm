; DESCRIPTION: Draws a cyan rectangle at (417, 11) with width 75 and height 91.
; PLAN: r0=417(x), r1=11(y), r2=75(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 11
LDI r2, 75
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
