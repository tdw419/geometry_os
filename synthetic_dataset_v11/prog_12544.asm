; DESCRIPTION: Renders a magenta box of size 100x33 starting at (14, 115).
; PLAN: r0=14(x), r1=115(y), r2=100(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 115
LDI r2, 100
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
