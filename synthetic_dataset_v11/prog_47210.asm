; DESCRIPTION: Renders a magenta box of size 12x34 starting at (45, 132).
; PLAN: r0=45(x), r1=132(y), r2=12(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 132
LDI r2, 12
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
