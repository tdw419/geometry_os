; DESCRIPTION: Draws a red line from (100, 159) to (223, 76).
; PLAN: r0=100(x1), r1=159(y1), r2=223(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 159
LDI r2, 223
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
