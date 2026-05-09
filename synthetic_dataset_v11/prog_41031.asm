; DESCRIPTION: Renders a magenta box of size 91x79 starting at (3, 9).
; PLAN: r0=3(x), r1=9(y), r2=91(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 9
LDI r2, 91
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
