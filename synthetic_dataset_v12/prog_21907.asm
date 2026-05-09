; DESCRIPTION: Draws a purple line from (321, 41) to (320, 85).
; PLAN: r0=321(x1), r1=41(y1), r2=320(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 41
LDI r2, 320
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
