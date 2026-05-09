; DESCRIPTION: Draws a red line from (400, 18) to (101, 241).
; PLAN: r0=400(x1), r1=18(y1), r2=101(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 18
LDI r2, 101
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
