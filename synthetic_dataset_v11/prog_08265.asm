; DESCRIPTION: Renders a yellow disk with center (66, 114) and radius 19.
; PLAN: r0=66(x), r1=114(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 114
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
