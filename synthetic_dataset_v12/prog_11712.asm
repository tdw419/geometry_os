; DESCRIPTION: Renders a blue line between points (388, 251) and (458, 107).
; PLAN: r0=388(x1), r1=251(y1), r2=458(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 251
LDI r2, 458
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
