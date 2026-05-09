; DESCRIPTION: Places a blue line segment connecting (279, 189) to (66, 38).
; PLAN: r0=279(x1), r1=189(y1), r2=66(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 189
LDI r2, 66
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
