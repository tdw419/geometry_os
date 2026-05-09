; DESCRIPTION: Renders a red disk with center (151, 78) and radius 75.
; PLAN: r0=151(x), r1=78(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 78
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
