; DESCRIPTION: Draws a green line from (110, 162) to (40, 245).
; PLAN: r0=110(x1), r1=162(y1), r2=40(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 162
LDI r2, 40
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
