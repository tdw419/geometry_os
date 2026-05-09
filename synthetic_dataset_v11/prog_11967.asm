; DESCRIPTION: Renders a green disk with center (198, 182) and radius 43.
; PLAN: r0=198(x), r1=182(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 182
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
