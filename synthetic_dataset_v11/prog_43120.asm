; DESCRIPTION: Places a blue line segment connecting (177, 13) to (125, 160).
; PLAN: r0=177(x1), r1=13(y1), r2=125(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 13
LDI r2, 125
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
