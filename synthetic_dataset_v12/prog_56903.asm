; DESCRIPTION: Draws a blue line from (243, 11) to (3, 108).
; PLAN: r0=243(x1), r1=11(y1), r2=3(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 11
LDI r2, 3
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
