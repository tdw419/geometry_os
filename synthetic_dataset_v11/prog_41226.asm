; DESCRIPTION: Places a yellow line segment connecting (229, 86) to (211, 172).
; PLAN: r0=229(x1), r1=86(y1), r2=211(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 86
LDI r2, 211
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
