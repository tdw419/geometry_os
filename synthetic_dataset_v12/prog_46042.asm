; DESCRIPTION: Draws a orange line from (385, 98) to (363, 39).
; PLAN: r0=385(x1), r1=98(y1), r2=363(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 98
LDI r2, 363
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
