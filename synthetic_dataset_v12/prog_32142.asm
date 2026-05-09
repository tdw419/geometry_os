; DESCRIPTION: Places a blue line segment connecting (290, 115) to (132, 108).
; PLAN: r0=290(x1), r1=115(y1), r2=132(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 115
LDI r2, 132
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
