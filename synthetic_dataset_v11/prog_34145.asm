; DESCRIPTION: Draws a red line from (221, 52) to (94, 120).
; PLAN: r0=221(x1), r1=52(y1), r2=94(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 52
LDI r2, 94
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
