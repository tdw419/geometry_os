; DESCRIPTION: Draws a red line from (166, 79) to (490, 181).
; PLAN: r0=166(x1), r1=79(y1), r2=490(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 79
LDI r2, 490
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
