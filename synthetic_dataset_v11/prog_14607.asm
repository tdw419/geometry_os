; DESCRIPTION: Renders a magenta box of size 73x31 starting at (102, 89).
; PLAN: r0=102(x), r1=89(y), r2=73(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 89
LDI r2, 73
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
