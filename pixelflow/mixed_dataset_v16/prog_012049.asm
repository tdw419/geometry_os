; DESCRIPTION: Places a magenta line segment connecting (296, 3) to (465, 34).
; PLAN: r0=296(x1), r1=3(y1), r2=465(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 3
LDI r2, 465
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
