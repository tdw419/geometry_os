; DESCRIPTION: Places a blue line segment connecting (273, 25) to (399, 152).
; PLAN: r0=273(x1), r1=25(y1), r2=399(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 25
LDI r2, 399
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
