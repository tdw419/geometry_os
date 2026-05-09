; DESCRIPTION: Draws a black line from (339, 75) to (38, 100).
; PLAN: r0=339(x1), r1=75(y1), r2=38(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 75
LDI r2, 38
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
