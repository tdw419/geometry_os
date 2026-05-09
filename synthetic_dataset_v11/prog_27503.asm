; DESCRIPTION: Renders a red disk with center (141, 151) and radius 70.
; PLAN: r0=141(x), r1=151(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 151
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
