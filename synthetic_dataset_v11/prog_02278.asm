; DESCRIPTION: Renders a yellow disk with center (115, 146) and radius 45.
; PLAN: r0=115(x), r1=146(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 146
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
