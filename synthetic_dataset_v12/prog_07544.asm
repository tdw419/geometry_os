; DESCRIPTION: Draws a magenta line from (80, 83) to (337, 18).
; PLAN: r0=80(x1), r1=83(y1), r2=337(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 83
LDI r2, 337
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
