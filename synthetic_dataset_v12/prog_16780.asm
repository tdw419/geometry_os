; DESCRIPTION: Draws a orange line from (385, 38) to (363, 107).
; PLAN: r0=385(x1), r1=38(y1), r2=363(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 38
LDI r2, 363
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
