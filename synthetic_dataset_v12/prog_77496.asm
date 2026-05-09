; DESCRIPTION: Draws a green rectangle at (63, 192) with width 79 and height 42.
; PLAN: r0=63(x), r1=192(y), r2=79(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 192
LDI r2, 79
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
