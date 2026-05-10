; DESCRIPTION: Draws a magenta line from (76, 3) to (484, 150).
; PLAN: r0=76(x1), r1=3(y1), r2=484(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 3
LDI r2, 484
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
