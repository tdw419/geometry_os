; DESCRIPTION: Renders a magenta disk with center (87, 52) and radius 10.
; PLAN: r0=87(x), r1=52(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 52
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
