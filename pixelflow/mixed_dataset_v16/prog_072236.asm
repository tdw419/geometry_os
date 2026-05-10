; DESCRIPTION: Renders a red disk with center (63, 182) and radius 19.
; PLAN: r0=63(x), r1=182(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 182
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
