; DESCRIPTION: Draws a magenta rectangle at (413, 89) with width 63 and height 16.
; PLAN: r0=413(x), r1=89(y), r2=63(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 89
LDI r2, 63
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
