; DESCRIPTION: Places a yellow line segment connecting (63, 200) to (170, 146).
; PLAN: r0=63(x1), r1=200(y1), r2=170(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 200
LDI r2, 170
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
