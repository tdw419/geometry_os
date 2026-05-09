; DESCRIPTION: Renders a magenta line between points (73, 146) and (41, 25).
; PLAN: r0=73(x1), r1=146(y1), r2=41(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 146
LDI r2, 41
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
