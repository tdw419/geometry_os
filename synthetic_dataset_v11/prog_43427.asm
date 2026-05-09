; DESCRIPTION: Renders a yellow disk with center (184, 182) and radius 25.
; PLAN: r0=184(x), r1=182(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 182
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
