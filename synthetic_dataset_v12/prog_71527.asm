; DESCRIPTION: Draws a magenta line from (262, 76) to (389, 80).
; PLAN: r0=262(x1), r1=76(y1), r2=389(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 76
LDI r2, 389
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
