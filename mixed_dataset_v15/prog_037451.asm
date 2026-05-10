; DESCRIPTION: Draws a magenta line from (199, 189) to (120, 41).
; PLAN: r0=199(x1), r1=189(y1), r2=120(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 189
LDI r2, 120
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
