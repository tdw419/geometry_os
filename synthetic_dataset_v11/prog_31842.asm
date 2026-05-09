; DESCRIPTION: Draws a orange line from (177, 22) to (13, 33).
; PLAN: r0=177(x1), r1=22(y1), r2=13(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 22
LDI r2, 13
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
