; DESCRIPTION: Draws a red line from (3, 252) to (127, 161).
; PLAN: r0=3(x1), r1=252(y1), r2=127(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 252
LDI r2, 127
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
