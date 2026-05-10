; DESCRIPTION: Draws a blue line from (377, 108) to (27, 75).
; PLAN: r0=377(x1), r1=108(y1), r2=27(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 108
LDI r2, 27
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
