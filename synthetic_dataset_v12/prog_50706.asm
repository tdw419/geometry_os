; DESCRIPTION: Draws a magenta line from (120, 37) to (1, 94).
; PLAN: r0=120(x1), r1=37(y1), r2=1(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 37
LDI r2, 1
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
