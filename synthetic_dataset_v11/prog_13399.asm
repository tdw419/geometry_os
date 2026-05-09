; DESCRIPTION: Draws a orange line from (104, 169) to (160, 198).
; PLAN: r0=104(x1), r1=169(y1), r2=160(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 169
LDI r2, 160
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
