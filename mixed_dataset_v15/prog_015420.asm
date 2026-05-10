; DESCRIPTION: Renders a magenta box of size 15x35 starting at (145, 191).
; PLAN: r0=145(x), r1=191(y), r2=15(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 191
LDI r2, 15
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
