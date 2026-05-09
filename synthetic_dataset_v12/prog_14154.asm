; DESCRIPTION: Places a blue line segment connecting (99, 178) to (386, 97).
; PLAN: r0=99(x1), r1=178(y1), r2=386(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 178
LDI r2, 386
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
