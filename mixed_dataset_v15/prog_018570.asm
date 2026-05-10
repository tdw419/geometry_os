; DESCRIPTION: Renders a magenta line between points (41, 56) and (45, 95).
; PLAN: r0=41(x1), r1=56(y1), r2=45(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 56
LDI r2, 45
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
