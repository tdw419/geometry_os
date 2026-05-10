; DESCRIPTION: Draws a magenta line from (37, 179) to (219, 233).
; PLAN: r0=37(x1), r1=179(y1), r2=219(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 179
LDI r2, 219
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
