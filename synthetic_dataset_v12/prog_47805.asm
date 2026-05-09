; DESCRIPTION: Places a red line segment connecting (409, 149) to (63, 110).
; PLAN: r0=409(x1), r1=149(y1), r2=63(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 149
LDI r2, 63
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
