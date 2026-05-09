; DESCRIPTION: Places a orange line segment connecting (102, 57) to (140, 146).
; PLAN: r0=102(x1), r1=57(y1), r2=140(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 57
LDI r2, 140
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
