; DESCRIPTION: Places a white line segment connecting (441, 245) to (385, 34).
; PLAN: r0=441(x1), r1=245(y1), r2=385(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 245
LDI r2, 385
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
