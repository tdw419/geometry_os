; DESCRIPTION: Places a magenta line segment connecting (34, 187) to (347, 202).
; PLAN: r0=34(x1), r1=187(y1), r2=347(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 187
LDI r2, 347
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
