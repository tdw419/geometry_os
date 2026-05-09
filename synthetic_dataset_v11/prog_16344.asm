; DESCRIPTION: Renders a green line between points (125, 83) and (92, 145).
; PLAN: r0=125(x1), r1=83(y1), r2=92(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 83
LDI r2, 92
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
