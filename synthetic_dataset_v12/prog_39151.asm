; DESCRIPTION: Renders a green disk with center (102, 148) and radius 66.
; PLAN: r0=102(x), r1=148(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 148
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
