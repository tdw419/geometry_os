; DESCRIPTION: Renders a red disk with center (54, 177) and radius 45.
; PLAN: r0=54(x), r1=177(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 177
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
