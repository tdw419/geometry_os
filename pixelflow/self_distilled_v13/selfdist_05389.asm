; DESCRIPTION: Draws a cyan rectangle at (109, 110) with width 12 and height 37.
; PLAN: r0=109(x), r1=110(y), r2=12(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 110
LDI r2, 12
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
