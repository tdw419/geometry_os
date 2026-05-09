; DESCRIPTION: Draws a red line from (89, 148) to (104, 37).
; PLAN: r0=89(x1), r1=148(y1), r2=104(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 148
LDI r2, 104
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
