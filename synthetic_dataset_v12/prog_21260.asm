; DESCRIPTION: Places a magenta line segment connecting (125, 41) to (180, 181).
; PLAN: r0=125(x1), r1=41(y1), r2=180(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 41
LDI r2, 180
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
