; DESCRIPTION: Renders a yellow disk with center (257, 119) and radius 27.
; PLAN: r0=257(x), r1=119(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 119
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
