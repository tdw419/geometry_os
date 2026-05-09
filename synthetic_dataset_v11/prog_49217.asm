; DESCRIPTION: Renders a purple disk with center (186, 93) and radius 26.
; PLAN: r0=186(x), r1=93(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 93
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
