; DESCRIPTION: Places a blue line segment connecting (370, 96) to (177, 23).
; PLAN: r0=370(x1), r1=96(y1), r2=177(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 96
LDI r2, 177
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
