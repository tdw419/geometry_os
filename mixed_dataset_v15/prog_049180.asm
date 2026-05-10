; DESCRIPTION: Places a red disk with center (129, 8) and radius 74.
; PLAN: r0=129(x), r1=8(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 8
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
