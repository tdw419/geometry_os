; DESCRIPTION: Places a magenta line segment connecting (432, 244) to (202, 24).
; PLAN: r0=432(x1), r1=244(y1), r2=202(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 244
LDI r2, 202
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
