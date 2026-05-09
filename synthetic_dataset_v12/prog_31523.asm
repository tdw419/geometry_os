; DESCRIPTION: Renders a red disk with center (169, 138) and radius 73.
; PLAN: r0=169(x), r1=138(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 138
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
