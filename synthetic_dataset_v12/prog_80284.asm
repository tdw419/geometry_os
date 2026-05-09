; DESCRIPTION: Places a magenta line segment connecting (75, 20) to (366, 25).
; PLAN: r0=75(x1), r1=20(y1), r2=366(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 20
LDI r2, 366
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
