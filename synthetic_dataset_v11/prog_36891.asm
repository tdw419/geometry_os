; DESCRIPTION: Places a yellow line segment connecting (75, 44) to (119, 115).
; PLAN: r0=75(x1), r1=44(y1), r2=119(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 44
LDI r2, 119
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
