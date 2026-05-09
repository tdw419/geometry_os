; DESCRIPTION: Renders a magenta box of size 71x66 starting at (357, 156).
; PLAN: r0=357(x), r1=156(y), r2=71(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 156
LDI r2, 71
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
