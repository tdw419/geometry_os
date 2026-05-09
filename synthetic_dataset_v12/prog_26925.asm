; DESCRIPTION: Renders a white line between points (419, 24) and (462, 221).
; PLAN: r0=419(x1), r1=24(y1), r2=462(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 24
LDI r2, 462
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
