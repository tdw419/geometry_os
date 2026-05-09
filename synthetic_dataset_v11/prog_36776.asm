; DESCRIPTION: Draws a red line from (87, 80) to (127, 245).
; PLAN: r0=87(x1), r1=80(y1), r2=127(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 80
LDI r2, 127
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
