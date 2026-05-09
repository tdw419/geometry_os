; DESCRIPTION: Renders a red disk with center (36, 101) and radius 16.
; PLAN: r0=36(x), r1=101(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 101
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
