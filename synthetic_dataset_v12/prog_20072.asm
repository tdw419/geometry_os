; DESCRIPTION: Draws a cyan rectangle at (474, 137) with width 23 and height 63.
; PLAN: r0=474(x), r1=137(y), r2=23(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 137
LDI r2, 23
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
