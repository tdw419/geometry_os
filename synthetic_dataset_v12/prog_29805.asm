; DESCRIPTION: Places a blue line segment connecting (260, 54) to (150, 229).
; PLAN: r0=260(x1), r1=54(y1), r2=150(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 54
LDI r2, 150
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
