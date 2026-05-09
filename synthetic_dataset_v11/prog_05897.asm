; DESCRIPTION: Renders a magenta box of size 38x101 starting at (203, 145).
; PLAN: r0=203(x), r1=145(y), r2=38(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 145
LDI r2, 38
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
