; DESCRIPTION: Renders a green disk with center (471, 60) and radius 19.
; PLAN: r0=471(x), r1=60(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 60
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
