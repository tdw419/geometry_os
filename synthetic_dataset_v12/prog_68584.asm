; DESCRIPTION: Places a yellow line segment connecting (36, 202) to (249, 162).
; PLAN: r0=36(x1), r1=202(y1), r2=249(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 202
LDI r2, 249
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
