; DESCRIPTION: Places a yellow line segment connecting (164, 66) to (273, 226).
; PLAN: r0=164(x1), r1=66(y1), r2=273(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 66
LDI r2, 273
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
