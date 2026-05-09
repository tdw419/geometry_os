; DESCRIPTION: Places a white line segment connecting (348, 44) to (441, 57).
; PLAN: r0=348(x1), r1=44(y1), r2=441(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 44
LDI r2, 441
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
