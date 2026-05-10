; DESCRIPTION: Places a blue line segment connecting (169, 68) to (243, 86).
; PLAN: r0=169(x1), r1=68(y1), r2=243(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 68
LDI r2, 243
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
