; DESCRIPTION: Draws a green rectangle at (427, 199) with width 42 and height 31.
; PLAN: r0=427(x), r1=199(y), r2=42(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 199
LDI r2, 42
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
