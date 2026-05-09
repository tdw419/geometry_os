; DESCRIPTION: Draws a red line from (76, 159) to (159, 28).
; PLAN: r0=76(x1), r1=159(y1), r2=159(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 159
LDI r2, 159
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
