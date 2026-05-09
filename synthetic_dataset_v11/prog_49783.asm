; DESCRIPTION: Draws a red line from (111, 105) to (212, 161).
; PLAN: r0=111(x1), r1=105(y1), r2=212(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 105
LDI r2, 212
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
