; DESCRIPTION: Renders a magenta box of size 28x78 starting at (156, 89).
; PLAN: r0=156(x), r1=89(y), r2=28(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 89
LDI r2, 28
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
