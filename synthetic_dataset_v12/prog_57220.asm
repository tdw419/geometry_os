; DESCRIPTION: Renders a yellow disk with center (168, 47) and radius 13.
; PLAN: r0=168(x), r1=47(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 47
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
