; DESCRIPTION: Draws a purple line from (120, 206) to (161, 85).
; PLAN: r0=120(x1), r1=206(y1), r2=161(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 206
LDI r2, 161
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
