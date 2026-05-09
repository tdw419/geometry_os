; DESCRIPTION: Places a white line segment connecting (208, 145) to (359, 177).
; PLAN: r0=208(x1), r1=145(y1), r2=359(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 145
LDI r2, 359
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
