; DESCRIPTION: Draws a cyan rectangle at (189, 96) with width 68 and height 63.
; PLAN: r0=189(x), r1=96(y), r2=68(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 96
LDI r2, 68
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
