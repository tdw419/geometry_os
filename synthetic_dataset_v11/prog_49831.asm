; DESCRIPTION: Draws a magenta line from (94, 29) to (131, 137).
; PLAN: r0=94(x1), r1=29(y1), r2=131(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 29
LDI r2, 131
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
