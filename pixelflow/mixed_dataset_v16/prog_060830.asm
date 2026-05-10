; DESCRIPTION: Renders a magenta box of size 61x33 starting at (138, 201).
; PLAN: r0=138(x), r1=201(y), r2=61(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 201
LDI r2, 61
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
