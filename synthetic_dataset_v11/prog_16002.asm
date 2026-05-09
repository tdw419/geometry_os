; DESCRIPTION: Draws a orange line from (139, 220) to (13, 177).
; PLAN: r0=139(x1), r1=220(y1), r2=13(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 220
LDI r2, 13
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
