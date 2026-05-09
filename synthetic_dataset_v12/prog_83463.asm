; DESCRIPTION: Renders a red disk with center (78, 64) and radius 31.
; PLAN: r0=78(x), r1=64(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 64
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
