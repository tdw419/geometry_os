; DESCRIPTION: Places a orange line segment connecting (304, 122) to (358, 146).
; PLAN: r0=304(x1), r1=122(y1), r2=358(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 122
LDI r2, 358
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
