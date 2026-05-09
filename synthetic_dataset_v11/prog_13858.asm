; DESCRIPTION: Draws a magenta line from (23, 70) to (249, 163).
; PLAN: r0=23(x1), r1=70(y1), r2=249(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 70
LDI r2, 249
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
