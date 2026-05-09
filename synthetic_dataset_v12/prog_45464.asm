; DESCRIPTION: Places a magenta line segment connecting (41, 18) to (231, 230).
; PLAN: r0=41(x1), r1=18(y1), r2=231(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 18
LDI r2, 231
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
