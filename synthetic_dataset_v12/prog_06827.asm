; DESCRIPTION: Renders a red disk with center (457, 162) and radius 22.
; PLAN: r0=457(x), r1=162(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 162
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
