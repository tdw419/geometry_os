; DESCRIPTION: Places a yellow line segment connecting (136, 177) to (103, 94).
; PLAN: r0=136(x1), r1=177(y1), r2=103(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 177
LDI r2, 103
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
