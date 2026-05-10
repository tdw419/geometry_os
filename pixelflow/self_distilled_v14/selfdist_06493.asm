; DESCRIPTION: Places a purple disk with center (341, 129) and radius 29.
; PLAN: r0=341(x), r1=129(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 129
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
