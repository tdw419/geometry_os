; DESCRIPTION: Draws a magenta line from (114, 41) to (399, 5).
; PLAN: r0=114(x1), r1=41(y1), r2=399(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 41
LDI r2, 399
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
