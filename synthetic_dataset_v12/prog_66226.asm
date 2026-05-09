; DESCRIPTION: Renders a magenta box of size 10x113 starting at (201, 100).
; PLAN: r0=201(x), r1=100(y), r2=10(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 100
LDI r2, 10
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
