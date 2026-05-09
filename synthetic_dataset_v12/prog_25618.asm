; DESCRIPTION: Draws a orange line from (404, 117) to (364, 149).
; PLAN: r0=404(x1), r1=117(y1), r2=364(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 117
LDI r2, 364
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
