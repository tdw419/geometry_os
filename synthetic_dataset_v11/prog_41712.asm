; DESCRIPTION: Draws a yellow line from (84, 94) to (64, 45).
; PLAN: r0=84(x1), r1=94(y1), r2=64(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 94
LDI r2, 64
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
