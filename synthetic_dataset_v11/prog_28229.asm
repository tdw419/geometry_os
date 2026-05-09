; DESCRIPTION: Places a magenta line segment connecting (34, 9) to (121, 178).
; PLAN: r0=34(x1), r1=9(y1), r2=121(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 9
LDI r2, 121
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
