; DESCRIPTION: Places a yellow line segment connecting (120, 152) to (94, 66).
; PLAN: r0=120(x1), r1=152(y1), r2=94(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 152
LDI r2, 94
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
