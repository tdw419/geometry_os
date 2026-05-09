; DESCRIPTION: Draws a blue line from (103, 211) to (169, 45).
; PLAN: r0=103(x1), r1=211(y1), r2=169(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 211
LDI r2, 169
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
