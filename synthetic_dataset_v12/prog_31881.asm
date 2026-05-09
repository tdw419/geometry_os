; DESCRIPTION: Places a yellow line segment connecting (86, 202) to (14, 86).
; PLAN: r0=86(x1), r1=202(y1), r2=14(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 202
LDI r2, 14
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
