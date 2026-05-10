; DESCRIPTION: Renders a red disk with center (204, 47) and radius 21.
; PLAN: r0=204(x), r1=47(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 47
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
