; DESCRIPTION: Places a white line segment connecting (470, 172) to (466, 208).
; PLAN: r0=470(x1), r1=172(y1), r2=466(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 172
LDI r2, 466
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
