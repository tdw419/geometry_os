; DESCRIPTION: Draws a orange line from (131, 80) to (40, 173).
; PLAN: r0=131(x1), r1=80(y1), r2=40(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 80
LDI r2, 40
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
