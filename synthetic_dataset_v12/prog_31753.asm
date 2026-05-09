; DESCRIPTION: Draws a orange line from (13, 38) to (315, 117).
; PLAN: r0=13(x1), r1=38(y1), r2=315(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 38
LDI r2, 315
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
