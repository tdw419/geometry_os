; DESCRIPTION: Draws a blue line from (85, 28) to (250, 33).
; PLAN: r0=85(x1), r1=28(y1), r2=250(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 28
LDI r2, 250
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
