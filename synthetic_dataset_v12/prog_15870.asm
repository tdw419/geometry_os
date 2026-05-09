; DESCRIPTION: Renders a blue line between points (273, 94) and (328, 172).
; PLAN: r0=273(x1), r1=94(y1), r2=328(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 94
LDI r2, 328
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
