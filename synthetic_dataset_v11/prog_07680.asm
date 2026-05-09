; DESCRIPTION: Places a magenta line segment connecting (41, 231) to (33, 254).
; PLAN: r0=41(x1), r1=231(y1), r2=33(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 231
LDI r2, 33
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
