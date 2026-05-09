; DESCRIPTION: Renders a magenta disk with center (128, 120) and radius 44.
; PLAN: r0=128(x), r1=120(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 120
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
