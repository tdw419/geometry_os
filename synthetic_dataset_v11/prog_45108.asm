; DESCRIPTION: Renders a blue line between points (9, 162) and (231, 20).
; PLAN: r0=9(x1), r1=162(y1), r2=231(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 162
LDI r2, 231
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
