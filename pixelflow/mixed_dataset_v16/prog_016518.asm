; DESCRIPTION: Places a blue line segment connecting (241, 187) to (185, 199).
; PLAN: r0=241(x1), r1=187(y1), r2=185(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 187
LDI r2, 185
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
