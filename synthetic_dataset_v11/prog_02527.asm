; DESCRIPTION: Renders a magenta box of size 119x25 starting at (22, 129).
; PLAN: r0=22(x), r1=129(y), r2=119(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 129
LDI r2, 119
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
