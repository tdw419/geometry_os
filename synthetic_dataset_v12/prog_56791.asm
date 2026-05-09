; DESCRIPTION: Places a magenta line segment connecting (322, 41) to (358, 54).
; PLAN: r0=322(x1), r1=41(y1), r2=358(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 41
LDI r2, 358
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
