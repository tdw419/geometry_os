; DESCRIPTION: Draws a green line from (141, 10) to (169, 9).
; PLAN: r0=141(x1), r1=10(y1), r2=169(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 10
LDI r2, 169
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
