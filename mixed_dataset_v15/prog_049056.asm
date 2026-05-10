; DESCRIPTION: Draws a red line from (140, 248) to (106, 131).
; PLAN: r0=140(x1), r1=248(y1), r2=106(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 248
LDI r2, 106
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
