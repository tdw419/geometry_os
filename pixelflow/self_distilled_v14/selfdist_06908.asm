; DESCRIPTION: Places a blue disk with center (115, 129) and radius 36.
; PLAN: r0=115(x), r1=129(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 129
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
