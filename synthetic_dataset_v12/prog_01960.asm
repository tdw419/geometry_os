; DESCRIPTION: Renders a magenta box of size 88x11 starting at (99, 109).
; PLAN: r0=99(x), r1=109(y), r2=88(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 109
LDI r2, 88
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
