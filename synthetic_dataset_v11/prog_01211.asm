; DESCRIPTION: Draws a white rectangle at (80, 89) with width 63 and height 68.
; PLAN: r0=80(x), r1=89(y), r2=63(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 89
LDI r2, 63
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
