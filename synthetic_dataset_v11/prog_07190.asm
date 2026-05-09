; DESCRIPTION: Places a blue line segment connecting (5, 135) to (152, 237).
; PLAN: r0=5(x1), r1=135(y1), r2=152(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 135
LDI r2, 152
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
