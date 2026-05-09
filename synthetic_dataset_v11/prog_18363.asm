; DESCRIPTION: Renders a blue line between points (149, 186) and (195, 220).
; PLAN: r0=149(x1), r1=186(y1), r2=195(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 186
LDI r2, 195
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
