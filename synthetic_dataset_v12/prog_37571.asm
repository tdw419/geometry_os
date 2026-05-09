; DESCRIPTION: Renders a blue line between points (160, 177) and (260, 142).
; PLAN: r0=160(x1), r1=177(y1), r2=260(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 177
LDI r2, 260
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
