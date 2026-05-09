; DESCRIPTION: Draws a blue line from (94, 50) to (151, 243).
; PLAN: r0=94(x1), r1=50(y1), r2=151(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 50
LDI r2, 151
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
