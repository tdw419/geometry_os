; DESCRIPTION: Renders a blue line between points (298, 133) and (370, 130).
; PLAN: r0=298(x1), r1=133(y1), r2=370(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 133
LDI r2, 370
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
