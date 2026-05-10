; DESCRIPTION: Renders a blue disk with center (335, 182) and radius 61.
; PLAN: r0=335(x), r1=182(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 182
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
