; DESCRIPTION: Places a yellow line segment connecting (78, 229) to (6, 243).
; PLAN: r0=78(x1), r1=229(y1), r2=6(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 229
LDI r2, 6
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
