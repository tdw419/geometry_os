; DESCRIPTION: Draws a cyan rectangle at (363, 6) with width 105 and height 68.
; PLAN: r0=363(x), r1=6(y), r2=105(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 6
LDI r2, 105
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
