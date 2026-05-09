; DESCRIPTION: Places a orange line segment connecting (16, 202) to (191, 141).
; PLAN: r0=16(x1), r1=202(y1), r2=191(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 202
LDI r2, 191
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
