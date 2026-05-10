; DESCRIPTION: Places a black line segment connecting (177, 169) to (75, 197).
; PLAN: r0=177(x1), r1=169(y1), r2=75(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 169
LDI r2, 75
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
