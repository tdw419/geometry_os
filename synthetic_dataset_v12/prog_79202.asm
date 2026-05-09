; DESCRIPTION: Renders a magenta box of size 110x57 starting at (234, 181).
; PLAN: r0=234(x), r1=181(y), r2=110(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 181
LDI r2, 110
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
