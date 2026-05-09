; DESCRIPTION: Places a blue line segment connecting (393, 47) to (206, 251).
; PLAN: r0=393(x1), r1=47(y1), r2=206(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 47
LDI r2, 206
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
