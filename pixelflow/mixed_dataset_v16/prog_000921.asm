; DESCRIPTION: Renders a magenta disk with center (363, 182) and radius 72.
; PLAN: r0=363(x), r1=182(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 182
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
