; DESCRIPTION: Renders a yellow disk with center (179, 165) and radius 72.
; PLAN: r0=179(x), r1=165(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 165
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
