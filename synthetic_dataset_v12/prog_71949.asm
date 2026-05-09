; DESCRIPTION: Renders a magenta box of size 54x81 starting at (201, 165).
; PLAN: r0=201(x), r1=165(y), r2=54(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 165
LDI r2, 54
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
