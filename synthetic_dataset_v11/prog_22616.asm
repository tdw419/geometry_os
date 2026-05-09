; DESCRIPTION: Renders a yellow disk with center (179, 141) and radius 38.
; PLAN: r0=179(x), r1=141(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 141
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
