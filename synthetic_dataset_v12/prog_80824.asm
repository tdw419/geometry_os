; DESCRIPTION: Draws a magenta line from (286, 89) to (443, 162).
; PLAN: r0=286(x1), r1=89(y1), r2=443(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 89
LDI r2, 443
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
