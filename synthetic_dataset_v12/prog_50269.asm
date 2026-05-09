; DESCRIPTION: Draws a red line from (245, 68) to (132, 241).
; PLAN: r0=245(x1), r1=68(y1), r2=132(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 68
LDI r2, 132
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
