; DESCRIPTION: Renders a magenta box of size 77x106 starting at (11, 50).
; PLAN: r0=11(x), r1=50(y), r2=77(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 50
LDI r2, 77
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
