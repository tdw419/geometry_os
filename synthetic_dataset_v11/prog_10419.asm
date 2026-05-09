; DESCRIPTION: Draws a cyan rectangle at (55, 86) with width 63 and height 95.
; PLAN: r0=55(x), r1=86(y), r2=63(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 86
LDI r2, 63
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
