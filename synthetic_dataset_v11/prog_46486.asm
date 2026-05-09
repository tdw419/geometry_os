; DESCRIPTION: Places a yellow line segment connecting (3, 109) to (125, 161).
; PLAN: r0=3(x1), r1=109(y1), r2=125(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 109
LDI r2, 125
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
