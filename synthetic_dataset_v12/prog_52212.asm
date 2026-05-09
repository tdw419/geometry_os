; DESCRIPTION: Renders a purple disk with center (120, 47) and radius 27.
; PLAN: r0=120(x), r1=47(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 47
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
