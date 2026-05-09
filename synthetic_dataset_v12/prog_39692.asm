; DESCRIPTION: Renders a yellow disk with center (386, 19) and radius 13.
; PLAN: r0=386(x), r1=19(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 19
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
