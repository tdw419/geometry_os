; DESCRIPTION: Draws a yellow line from (50, 162) to (458, 131).
; PLAN: r0=50(x1), r1=162(y1), r2=458(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 162
LDI r2, 458
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
