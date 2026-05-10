; DESCRIPTION: Draws a magenta line from (336, 193) to (94, 60).
; PLAN: r0=336(x1), r1=193(y1), r2=94(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 193
LDI r2, 94
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
