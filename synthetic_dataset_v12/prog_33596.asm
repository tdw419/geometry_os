; DESCRIPTION: Draws a yellow line from (382, 41) to (311, 138).
; PLAN: r0=382(x1), r1=41(y1), r2=311(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 41
LDI r2, 311
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
