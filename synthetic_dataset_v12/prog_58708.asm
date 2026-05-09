; DESCRIPTION: Renders a magenta box of size 18x57 starting at (145, 129).
; PLAN: r0=145(x), r1=129(y), r2=18(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 129
LDI r2, 18
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
