; DESCRIPTION: Places a black line segment connecting (250, 152) to (158, 150).
; PLAN: r0=250(x1), r1=152(y1), r2=158(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 152
LDI r2, 158
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
