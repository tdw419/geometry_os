; DESCRIPTION: Places a yellow line segment connecting (144, 119) to (177, 6).
; PLAN: r0=144(x1), r1=119(y1), r2=177(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 119
LDI r2, 177
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
