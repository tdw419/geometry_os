; DESCRIPTION: Renders a red disk with center (252, 47) and radius 34.
; PLAN: r0=252(x), r1=47(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 47
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
