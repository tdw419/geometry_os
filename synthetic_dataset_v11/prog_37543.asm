; DESCRIPTION: Draws a white line from (104, 89) to (245, 77).
; PLAN: r0=104(x1), r1=89(y1), r2=245(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 89
LDI r2, 245
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
