; DESCRIPTION: Draws a red line from (17, 79) to (501, 45).
; PLAN: r0=17(x1), r1=79(y1), r2=501(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 79
LDI r2, 501
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
