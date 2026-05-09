; DESCRIPTION: Draws a orange line from (146, 89) to (131, 160).
; PLAN: r0=146(x1), r1=89(y1), r2=131(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 89
LDI r2, 131
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
