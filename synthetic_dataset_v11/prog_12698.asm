; DESCRIPTION: Draws a red line from (104, 205) to (227, 205).
; PLAN: r0=104(x1), r1=205(y1), r2=227(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 205
LDI r2, 227
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
