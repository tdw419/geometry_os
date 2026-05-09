; DESCRIPTION: Draws a blue line from (161, 220) to (63, 212).
; PLAN: r0=161(x1), r1=220(y1), r2=63(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 220
LDI r2, 63
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
