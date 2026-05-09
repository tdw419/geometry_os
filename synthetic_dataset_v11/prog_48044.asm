; DESCRIPTION: Places a blue line segment connecting (72, 57) to (187, 79).
; PLAN: r0=72(x1), r1=57(y1), r2=187(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 57
LDI r2, 187
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
