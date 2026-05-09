; DESCRIPTION: Draws a orange line from (248, 30) to (501, 255).
; PLAN: r0=248(x1), r1=30(y1), r2=501(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 30
LDI r2, 501
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
