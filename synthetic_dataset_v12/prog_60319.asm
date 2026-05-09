; DESCRIPTION: Renders a blue disk with center (267, 182) and radius 48.
; PLAN: r0=267(x), r1=182(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 182
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
