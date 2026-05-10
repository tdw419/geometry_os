; DESCRIPTION: Places a white line segment connecting (382, 129) to (336, 64).
; PLAN: r0=382(x1), r1=129(y1), r2=336(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 129
LDI r2, 336
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
