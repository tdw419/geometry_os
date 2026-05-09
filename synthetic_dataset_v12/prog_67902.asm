; DESCRIPTION: Renders a red disk with center (248, 157) and radius 66.
; PLAN: r0=248(x), r1=157(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 157
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
