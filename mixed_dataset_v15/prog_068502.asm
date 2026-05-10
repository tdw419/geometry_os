; DESCRIPTION: Draws a blue line from (492, 169) to (50, 127).
; PLAN: r0=492(x1), r1=169(y1), r2=50(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 169
LDI r2, 50
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
