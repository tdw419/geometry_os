; DESCRIPTION: Places a yellow line segment connecting (167, 6) to (149, 21).
; PLAN: r0=167(x1), r1=6(y1), r2=149(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 6
LDI r2, 149
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
