; DESCRIPTION: Renders a magenta box of size 91x84 starting at (54, 100).
; PLAN: r0=54(x), r1=100(y), r2=91(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 100
LDI r2, 91
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
