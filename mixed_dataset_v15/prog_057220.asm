; DESCRIPTION: Draws a white line from (104, 29) to (43, 80).
; PLAN: r0=104(x1), r1=29(y1), r2=43(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 29
LDI r2, 43
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
