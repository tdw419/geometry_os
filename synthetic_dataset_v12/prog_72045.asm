; DESCRIPTION: Renders a magenta disk with center (54, 13) and radius 10.
; PLAN: r0=54(x), r1=13(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 13
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
