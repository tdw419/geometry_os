; DESCRIPTION: Draws a red line from (13, 241) to (171, 110).
; PLAN: r0=13(x1), r1=241(y1), r2=171(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 241
LDI r2, 171
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
