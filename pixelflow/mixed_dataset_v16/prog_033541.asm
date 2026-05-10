; DESCRIPTION: Draws a red line from (423, 125) to (308, 39).
; PLAN: r0=423(x1), r1=125(y1), r2=308(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 125
LDI r2, 308
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
