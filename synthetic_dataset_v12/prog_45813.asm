; DESCRIPTION: Renders a blue line between points (83, 118) and (370, 107).
; PLAN: r0=83(x1), r1=118(y1), r2=370(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 118
LDI r2, 370
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
