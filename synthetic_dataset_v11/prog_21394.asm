; DESCRIPTION: Renders a green disk with center (90, 182) and radius 58.
; PLAN: r0=90(x), r1=182(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 182
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
