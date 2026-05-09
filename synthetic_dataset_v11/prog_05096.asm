; DESCRIPTION: Places a yellow line segment connecting (143, 145) to (186, 6).
; PLAN: r0=143(x1), r1=145(y1), r2=186(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 145
LDI r2, 186
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
