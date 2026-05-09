; DESCRIPTION: Draws a cyan rectangle at (272, 3) with width 36 and height 63.
; PLAN: r0=272(x), r1=3(y), r2=36(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 3
LDI r2, 36
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
