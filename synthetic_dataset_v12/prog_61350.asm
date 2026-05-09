; DESCRIPTION: Renders a yellow disk with center (406, 47) and radius 35.
; PLAN: r0=406(x), r1=47(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 47
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
