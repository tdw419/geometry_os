; DESCRIPTION: Renders a yellow disk with center (30, 182) and radius 28.
; PLAN: r0=30(x), r1=182(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 182
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
