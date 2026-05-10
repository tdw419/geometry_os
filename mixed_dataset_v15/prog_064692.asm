; DESCRIPTION: Draws a magenta line from (115, 37) to (314, 24).
; PLAN: r0=115(x1), r1=37(y1), r2=314(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 37
LDI r2, 314
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
