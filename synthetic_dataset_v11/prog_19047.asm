; DESCRIPTION: Renders a yellow disk with center (187, 31) and radius 19.
; PLAN: r0=187(x), r1=31(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 31
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
