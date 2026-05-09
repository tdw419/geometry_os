; DESCRIPTION: Renders a green disk with center (150, 182) and radius 69.
; PLAN: r0=150(x), r1=182(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 182
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
