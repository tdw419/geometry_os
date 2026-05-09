; DESCRIPTION: Renders a red disk with center (188, 94) and radius 56.
; PLAN: r0=188(x), r1=94(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 94
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
