; DESCRIPTION: Draws a red line from (41, 149) to (170, 8).
; PLAN: r0=41(x1), r1=149(y1), r2=170(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 149
LDI r2, 170
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
