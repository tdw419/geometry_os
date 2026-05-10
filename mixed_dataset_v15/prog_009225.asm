; DESCRIPTION: Renders a purple disk with center (335, 186) and radius 53.
; PLAN: r0=335(x), r1=186(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 186
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
