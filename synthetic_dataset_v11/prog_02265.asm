; DESCRIPTION: Places a blue line segment connecting (243, 243) to (88, 68).
; PLAN: r0=243(x1), r1=243(y1), r2=88(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 243
LDI r2, 88
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
