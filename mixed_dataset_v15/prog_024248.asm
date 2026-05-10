; DESCRIPTION: Draws a blue line from (72, 142) to (70, 131).
; PLAN: r0=72(x1), r1=142(y1), r2=70(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 142
LDI r2, 70
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
