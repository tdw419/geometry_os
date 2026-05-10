; DESCRIPTION: Renders a blue circular shape at (352, 182) with radius 53.
; PLAN: r0=352(x), r1=182(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 182
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
