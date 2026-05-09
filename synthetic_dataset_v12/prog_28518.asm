; DESCRIPTION: Draws a magenta line from (41, 138) to (27, 232).
; PLAN: r0=41(x1), r1=138(y1), r2=27(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 138
LDI r2, 27
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
