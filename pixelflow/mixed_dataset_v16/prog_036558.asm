; DESCRIPTION: Draws a blue line from (2, 80) to (13, 120).
; PLAN: r0=2(x1), r1=80(y1), r2=13(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 80
LDI r2, 13
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
