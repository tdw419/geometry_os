; DESCRIPTION: Renders a green disk with center (100, 124) and radius 63.
; PLAN: r0=100(x), r1=124(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 124
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
