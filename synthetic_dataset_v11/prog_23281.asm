; DESCRIPTION: Places a red line segment connecting (164, 251) to (191, 13).
; PLAN: r0=164(x1), r1=251(y1), r2=191(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 251
LDI r2, 191
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
