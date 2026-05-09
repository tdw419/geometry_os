; DESCRIPTION: Places a blue line segment connecting (331, 149) to (12, 221).
; PLAN: r0=331(x1), r1=149(y1), r2=12(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 149
LDI r2, 12
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
