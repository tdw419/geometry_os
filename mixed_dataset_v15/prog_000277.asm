; DESCRIPTION: Renders a yellow line between points (162, 212) and (389, 19).
; PLAN: r0=162(x1), r1=212(y1), r2=389(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 212
LDI r2, 389
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
