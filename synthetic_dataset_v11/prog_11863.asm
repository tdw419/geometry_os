; DESCRIPTION: Places a red line segment connecting (31, 181) to (70, 43).
; PLAN: r0=31(x1), r1=181(y1), r2=70(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 181
LDI r2, 70
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
