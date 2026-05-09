; DESCRIPTION: Places a yellow line segment connecting (243, 100) to (7, 61).
; PLAN: r0=243(x1), r1=100(y1), r2=7(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 100
LDI r2, 7
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
