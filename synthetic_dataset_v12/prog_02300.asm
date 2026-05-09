; DESCRIPTION: Places a yellow line segment connecting (36, 79) to (16, 165).
; PLAN: r0=36(x1), r1=79(y1), r2=16(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 79
LDI r2, 16
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
