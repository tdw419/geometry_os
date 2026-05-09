; DESCRIPTION: Draws a red line from (159, 178) to (144, 54).
; PLAN: r0=159(x1), r1=178(y1), r2=144(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 178
LDI r2, 144
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
