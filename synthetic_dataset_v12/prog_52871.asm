; DESCRIPTION: Places a red circle of radius 38 at center (253, 175).
; PLAN: r0=253(x), r1=175(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 175
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
