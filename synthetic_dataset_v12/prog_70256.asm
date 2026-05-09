; DESCRIPTION: Draws a white line from (212, 79) to (347, 9).
; PLAN: r0=212(x1), r1=79(y1), r2=347(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 79
LDI r2, 347
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
