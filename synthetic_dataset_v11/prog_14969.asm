; DESCRIPTION: Places a blue line segment connecting (112, 16) to (165, 220).
; PLAN: r0=112(x1), r1=16(y1), r2=165(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 16
LDI r2, 165
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
