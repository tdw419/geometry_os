; DESCRIPTION: Renders a yellow disk with center (84, 93) and radius 73.
; PLAN: r0=84(x), r1=93(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 93
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
