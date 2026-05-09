; DESCRIPTION: Places a yellow line segment connecting (177, 137) to (255, 90).
; PLAN: r0=177(x1), r1=137(y1), r2=255(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 137
LDI r2, 255
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
