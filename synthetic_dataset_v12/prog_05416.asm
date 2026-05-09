; DESCRIPTION: Draws a blue line from (435, 56) to (300, 204).
; PLAN: r0=435(x1), r1=56(y1), r2=300(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 56
LDI r2, 300
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
