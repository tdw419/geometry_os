; DESCRIPTION: Draws a magenta line from (41, 77) to (146, 250).
; PLAN: r0=41(x1), r1=77(y1), r2=146(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 77
LDI r2, 146
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
