; DESCRIPTION: Places a blue line segment connecting (60, 4) to (182, 89).
; PLAN: r0=60(x1), r1=4(y1), r2=182(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 4
LDI r2, 182
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
