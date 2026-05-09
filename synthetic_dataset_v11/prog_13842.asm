; DESCRIPTION: Renders a red disk with center (138, 167) and radius 56.
; PLAN: r0=138(x), r1=167(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 167
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
