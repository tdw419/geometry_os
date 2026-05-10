; DESCRIPTION: Draws a red line from (377, 35) to (21, 45).
; PLAN: r0=377(x1), r1=35(y1), r2=21(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 35
LDI r2, 21
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
