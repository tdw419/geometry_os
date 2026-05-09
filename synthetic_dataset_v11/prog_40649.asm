; DESCRIPTION: Places a blue line segment connecting (152, 184) to (251, 59).
; PLAN: r0=152(x1), r1=184(y1), r2=251(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 184
LDI r2, 251
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
