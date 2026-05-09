; DESCRIPTION: Renders a red disk with center (163, 146) and radius 71.
; PLAN: r0=163(x), r1=146(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 146
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
