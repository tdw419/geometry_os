; DESCRIPTION: Draws a magenta line from (64, 80) to (41, 84).
; PLAN: r0=64(x1), r1=80(y1), r2=41(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 80
LDI r2, 41
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
