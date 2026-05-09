; DESCRIPTION: Places a blue line segment connecting (261, 70) to (152, 205).
; PLAN: r0=261(x1), r1=70(y1), r2=152(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 70
LDI r2, 152
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
