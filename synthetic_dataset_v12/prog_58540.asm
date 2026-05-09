; DESCRIPTION: Renders a white line between points (317, 80) and (269, 89).
; PLAN: r0=317(x1), r1=80(y1), r2=269(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 80
LDI r2, 269
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
