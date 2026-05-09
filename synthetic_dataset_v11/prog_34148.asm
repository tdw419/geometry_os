; DESCRIPTION: Places a yellow line segment connecting (242, 192) to (66, 211).
; PLAN: r0=242(x1), r1=192(y1), r2=66(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 192
LDI r2, 66
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
