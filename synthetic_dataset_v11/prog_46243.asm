; DESCRIPTION: Draws a blue line from (170, 150) to (60, 70).
; PLAN: r0=170(x1), r1=150(y1), r2=60(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 150
LDI r2, 60
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
