; DESCRIPTION: Renders a blue line between points (143, 0) and (303, 124).
; PLAN: r0=143(x1), r1=0(y1), r2=303(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 0
LDI r2, 303
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
