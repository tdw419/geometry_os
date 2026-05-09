; DESCRIPTION: Places a blue line segment connecting (37, 66) to (162, 231).
; PLAN: r0=37(x1), r1=66(y1), r2=162(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 66
LDI r2, 162
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
