; DESCRIPTION: Draws a red line from (137, 9) to (1, 44).
; PLAN: r0=137(x1), r1=9(y1), r2=1(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 9
LDI r2, 1
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
