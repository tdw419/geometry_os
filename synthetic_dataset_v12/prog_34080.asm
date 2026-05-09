; DESCRIPTION: Places a blue line segment connecting (470, 71) to (75, 212).
; PLAN: r0=470(x1), r1=71(y1), r2=75(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 71
LDI r2, 75
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
