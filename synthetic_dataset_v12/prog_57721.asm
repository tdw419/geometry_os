; DESCRIPTION: Renders a black line between points (419, 154) and (186, 48).
; PLAN: r0=419(x1), r1=154(y1), r2=186(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 154
LDI r2, 186
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
