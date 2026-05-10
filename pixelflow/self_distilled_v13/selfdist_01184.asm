; DESCRIPTION: Places a red disk with center (129, 73) and radius 24.
; PLAN: r0=129(x), r1=73(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 73
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
