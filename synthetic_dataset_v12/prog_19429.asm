; DESCRIPTION: Renders a red disk with center (279, 109) and radius 45.
; PLAN: r0=279(x), r1=109(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 109
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
