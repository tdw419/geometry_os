; DESCRIPTION: Renders a magenta box of size 87x88 starting at (54, 11).
; PLAN: r0=54(x), r1=11(y), r2=87(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 11
LDI r2, 87
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
