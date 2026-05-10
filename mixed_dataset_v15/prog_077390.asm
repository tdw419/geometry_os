; DESCRIPTION: Renders a magenta disk with center (156, 179) and radius 54.
; PLAN: r0=156(x), r1=179(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 179
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
