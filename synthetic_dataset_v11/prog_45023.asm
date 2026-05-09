; DESCRIPTION: Draws a cyan rectangle at (178, 18) with width 63 and height 106.
; PLAN: r0=178(x), r1=18(y), r2=63(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 18
LDI r2, 63
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
