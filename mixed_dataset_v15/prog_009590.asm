; DESCRIPTION: Renders a magenta circular shape at (335, 182) with radius 10.
; PLAN: r0=335(x), r1=182(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 182
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
