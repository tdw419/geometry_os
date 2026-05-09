; DESCRIPTION: Places a white line segment connecting (133, 245) to (198, 66).
; PLAN: r0=133(x1), r1=245(y1), r2=198(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 245
LDI r2, 198
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
