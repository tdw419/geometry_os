; DESCRIPTION: Places a blue line segment connecting (22, 152) to (183, 244).
; PLAN: r0=22(x1), r1=152(y1), r2=183(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 152
LDI r2, 183
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
