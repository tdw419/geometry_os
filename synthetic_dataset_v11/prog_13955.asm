; DESCRIPTION: Renders a black disk with center (66, 168) and radius 58.
; PLAN: r0=66(x), r1=168(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 168
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
