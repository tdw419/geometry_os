; DESCRIPTION: Places a white line segment connecting (441, 33) to (90, 35).
; PLAN: r0=441(x1), r1=33(y1), r2=90(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 33
LDI r2, 90
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
