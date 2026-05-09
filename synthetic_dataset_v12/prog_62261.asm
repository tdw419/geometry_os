; DESCRIPTION: Renders a red disk with center (181, 94) and radius 20.
; PLAN: r0=181(x), r1=94(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 94
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
