; DESCRIPTION: Places a blue line segment connecting (109, 223) to (113, 251).
; PLAN: r0=109(x1), r1=223(y1), r2=113(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 223
LDI r2, 113
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
