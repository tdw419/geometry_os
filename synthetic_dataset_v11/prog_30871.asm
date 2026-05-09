; DESCRIPTION: Draws a red line from (223, 5) to (108, 233).
; PLAN: r0=223(x1), r1=5(y1), r2=108(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 5
LDI r2, 108
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
