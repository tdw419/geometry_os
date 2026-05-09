; DESCRIPTION: Places a purple line segment connecting (46, 47) to (120, 9).
; PLAN: r0=46(x1), r1=47(y1), r2=120(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 47
LDI r2, 120
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
