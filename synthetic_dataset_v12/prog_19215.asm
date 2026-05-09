; DESCRIPTION: Renders a red disk with center (293, 192) and radius 36.
; PLAN: r0=293(x), r1=192(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 192
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
