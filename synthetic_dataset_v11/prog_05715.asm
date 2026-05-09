; DESCRIPTION: Renders a blue disk with center (237, 182) and radius 12.
; PLAN: r0=237(x), r1=182(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 182
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
