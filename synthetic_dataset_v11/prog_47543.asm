; DESCRIPTION: Places a yellow line segment connecting (223, 216) to (220, 94).
; PLAN: r0=223(x1), r1=216(y1), r2=220(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 216
LDI r2, 220
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
