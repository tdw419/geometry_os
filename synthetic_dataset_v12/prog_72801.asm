; DESCRIPTION: Draws a red line from (491, 70) to (45, 131).
; PLAN: r0=491(x1), r1=70(y1), r2=45(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 70
LDI r2, 45
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
