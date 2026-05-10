; DESCRIPTION: Draws a cyan rectangle at (272, 54) with width 85 and height 40.
; PLAN: r0=272(x), r1=54(y), r2=85(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 54
LDI r2, 85
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
