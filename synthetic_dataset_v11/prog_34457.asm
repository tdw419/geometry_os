; DESCRIPTION: Draws a yellow line from (211, 4) to (162, 44).
; PLAN: r0=211(x1), r1=4(y1), r2=162(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 4
LDI r2, 162
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
