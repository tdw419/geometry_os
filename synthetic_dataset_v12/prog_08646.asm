; DESCRIPTION: Draws a yellow line from (381, 87) to (95, 140).
; PLAN: r0=381(x1), r1=87(y1), r2=95(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 87
LDI r2, 95
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
