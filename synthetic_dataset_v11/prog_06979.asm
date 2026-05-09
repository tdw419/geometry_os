; DESCRIPTION: Renders a red disk with center (115, 177) and radius 75.
; PLAN: r0=115(x), r1=177(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 177
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
