; DESCRIPTION: Draws a yellow line from (94, 32) to (91, 110).
; PLAN: r0=94(x1), r1=32(y1), r2=91(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 32
LDI r2, 91
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
