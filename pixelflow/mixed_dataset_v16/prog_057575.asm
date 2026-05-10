; DESCRIPTION: Places a purple disk with center (95, 129) and radius 55.
; PLAN: r0=95(x), r1=129(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 129
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
