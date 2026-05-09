; DESCRIPTION: Places a blue line segment connecting (342, 44) to (191, 187).
; PLAN: r0=342(x1), r1=44(y1), r2=191(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 44
LDI r2, 191
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
