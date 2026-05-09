; DESCRIPTION: Draws a yellow line from (393, 216) to (131, 163).
; PLAN: r0=393(x1), r1=216(y1), r2=131(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 216
LDI r2, 131
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
