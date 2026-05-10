; DESCRIPTION: Renders a magenta box of size 21x101 starting at (334, 3).
; PLAN: r0=334(x), r1=3(y), r2=21(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 3
LDI r2, 21
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
