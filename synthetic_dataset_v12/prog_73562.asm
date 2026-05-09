; DESCRIPTION: Renders a red disk with center (176, 78) and radius 70.
; PLAN: r0=176(x), r1=78(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 78
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
