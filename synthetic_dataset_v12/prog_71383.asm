; DESCRIPTION: Draws a magenta rectangle at (379, 161) with width 85 and height 91.
; PLAN: r0=379(x), r1=161(y), r2=85(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 161
LDI r2, 85
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
