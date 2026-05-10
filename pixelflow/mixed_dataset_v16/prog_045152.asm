; DESCRIPTION: Renders a magenta box of size 75x118 starting at (234, 46).
; PLAN: r0=234(x), r1=46(y), r2=75(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 46
LDI r2, 75
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
