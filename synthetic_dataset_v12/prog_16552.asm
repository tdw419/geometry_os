; DESCRIPTION: Renders a magenta disk with center (301, 137) and radius 74.
; PLAN: r0=301(x), r1=137(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 137
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
