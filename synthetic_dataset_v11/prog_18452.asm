; DESCRIPTION: Places a black line segment connecting (153, 145) to (177, 240).
; PLAN: r0=153(x1), r1=145(y1), r2=177(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 145
LDI r2, 177
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
