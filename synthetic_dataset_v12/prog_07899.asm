; DESCRIPTION: Places a magenta line segment connecting (328, 225) to (432, 134).
; PLAN: r0=328(x1), r1=225(y1), r2=432(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 225
LDI r2, 432
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
