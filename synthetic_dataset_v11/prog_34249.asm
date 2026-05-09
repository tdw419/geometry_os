; DESCRIPTION: Places a white line segment connecting (219, 129) to (93, 204).
; PLAN: r0=219(x1), r1=129(y1), r2=93(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 129
LDI r2, 93
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
