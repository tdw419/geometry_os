; DESCRIPTION: Renders a yellow disk with center (66, 111) and radius 33.
; PLAN: r0=66(x), r1=111(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 111
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
