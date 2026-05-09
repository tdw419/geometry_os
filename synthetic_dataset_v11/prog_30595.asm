; DESCRIPTION: Renders a red disk with center (102, 179) and radius 61.
; PLAN: r0=102(x), r1=179(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 179
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
