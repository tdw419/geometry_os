; DESCRIPTION: Draws a white line from (441, 169) to (339, 60).
; PLAN: r0=441(x1), r1=169(y1), r2=339(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 169
LDI r2, 339
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
