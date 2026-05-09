; DESCRIPTION: Draws a red line from (241, 241) to (223, 200).
; PLAN: r0=241(x1), r1=241(y1), r2=223(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 241
LDI r2, 223
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
