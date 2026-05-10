; DESCRIPTION: Places a blue line segment connecting (172, 5) to (277, 14).
; PLAN: r0=172(x1), r1=5(y1), r2=277(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 5
LDI r2, 277
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
