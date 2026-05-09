; DESCRIPTION: Renders a red disk with center (31, 232) and radius 16.
; PLAN: r0=31(x), r1=232(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 232
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
