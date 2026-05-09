; DESCRIPTION: Places a blue line segment connecting (186, 70) to (100, 192).
; PLAN: r0=186(x1), r1=70(y1), r2=100(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 70
LDI r2, 100
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
