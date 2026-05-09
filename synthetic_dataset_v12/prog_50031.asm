; DESCRIPTION: Renders a white line between points (419, 56) and (474, 104).
; PLAN: r0=419(x1), r1=56(y1), r2=474(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 56
LDI r2, 474
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
