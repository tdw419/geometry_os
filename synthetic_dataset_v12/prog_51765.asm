; DESCRIPTION: Renders a magenta disk with center (412, 85) and radius 56.
; PLAN: r0=412(x), r1=85(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 85
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
