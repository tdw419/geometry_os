; DESCRIPTION: Renders a red disk with center (148, 151) and radius 52.
; PLAN: r0=148(x), r1=151(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 151
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
