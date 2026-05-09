; DESCRIPTION: Places a yellow line segment connecting (219, 24) to (36, 146).
; PLAN: r0=219(x1), r1=24(y1), r2=36(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 24
LDI r2, 36
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
