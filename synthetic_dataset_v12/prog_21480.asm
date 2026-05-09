; DESCRIPTION: Draws a red line from (400, 59) to (471, 31).
; PLAN: r0=400(x1), r1=59(y1), r2=471(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 59
LDI r2, 471
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
