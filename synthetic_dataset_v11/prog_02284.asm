; DESCRIPTION: Places a blue line segment connecting (143, 66) to (39, 0).
; PLAN: r0=143(x1), r1=66(y1), r2=39(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 66
LDI r2, 39
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
