; DESCRIPTION: Draws a magenta line from (41, 109) to (31, 8).
; PLAN: r0=41(x1), r1=109(y1), r2=31(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 109
LDI r2, 31
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
