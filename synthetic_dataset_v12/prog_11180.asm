; DESCRIPTION: Renders a yellow disk with center (306, 93) and radius 45.
; PLAN: r0=306(x), r1=93(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 93
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
