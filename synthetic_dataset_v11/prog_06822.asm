; DESCRIPTION: Draws a green line from (85, 104) to (229, 36).
; PLAN: r0=85(x1), r1=104(y1), r2=229(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 104
LDI r2, 229
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
