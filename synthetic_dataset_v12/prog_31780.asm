; DESCRIPTION: Places a yellow line segment connecting (343, 148) to (12, 146).
; PLAN: r0=343(x1), r1=148(y1), r2=12(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 148
LDI r2, 12
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
