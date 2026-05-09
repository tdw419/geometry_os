; DESCRIPTION: Renders a magenta box of size 55x31 starting at (145, 20).
; PLAN: r0=145(x), r1=20(y), r2=55(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 20
LDI r2, 55
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
