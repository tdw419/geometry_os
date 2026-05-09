; DESCRIPTION: Draws a orange line from (186, 54) to (221, 131).
; PLAN: r0=186(x1), r1=54(y1), r2=221(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 54
LDI r2, 221
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
