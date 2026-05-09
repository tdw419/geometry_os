; DESCRIPTION: Places a yellow line segment connecting (301, 79) to (102, 148).
; PLAN: r0=301(x1), r1=79(y1), r2=102(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 79
LDI r2, 102
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
