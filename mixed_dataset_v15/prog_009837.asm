; DESCRIPTION: Draws a blue line from (158, 20) to (308, 76).
; PLAN: r0=158(x1), r1=20(y1), r2=308(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 20
LDI r2, 308
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
