; DESCRIPTION: Renders a red disk with center (151, 140) and radius 80.
; PLAN: r0=151(x), r1=140(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 140
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
