; DESCRIPTION: Draws a cyan rectangle at (195, 178) with width 52 and height 62.
; PLAN: r0=195(x), r1=178(y), r2=52(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 178
LDI r2, 52
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
