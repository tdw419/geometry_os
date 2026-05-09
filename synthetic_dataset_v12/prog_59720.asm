; DESCRIPTION: Renders a yellow disk with center (66, 121) and radius 65.
; PLAN: r0=66(x), r1=121(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 121
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
