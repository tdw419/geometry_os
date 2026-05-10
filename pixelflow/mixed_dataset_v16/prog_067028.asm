; DESCRIPTION: Places a blue line segment connecting (466, 95) to (470, 68).
; PLAN: r0=466(x1), r1=95(y1), r2=470(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 95
LDI r2, 470
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
