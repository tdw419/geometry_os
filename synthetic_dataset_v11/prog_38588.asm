; DESCRIPTION: Renders a black disk with center (148, 146) and radius 21.
; PLAN: r0=148(x), r1=146(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 146
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
