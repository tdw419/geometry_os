; DESCRIPTION: Renders a magenta box of size 94x11 starting at (312, 2).
; PLAN: r0=312(x), r1=2(y), r2=94(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 2
LDI r2, 94
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
