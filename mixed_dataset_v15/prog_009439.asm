; DESCRIPTION: Renders a blue line between points (260, 172) and (71, 243).
; PLAN: r0=260(x1), r1=172(y1), r2=71(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 172
LDI r2, 71
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
