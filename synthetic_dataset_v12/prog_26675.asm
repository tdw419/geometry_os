; DESCRIPTION: Places a yellow line segment connecting (350, 178) to (186, 34).
; PLAN: r0=350(x1), r1=178(y1), r2=186(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 178
LDI r2, 186
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
