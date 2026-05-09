; DESCRIPTION: Draws a blue line from (262, 240) to (505, 148).
; PLAN: r0=262(x1), r1=240(y1), r2=505(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 240
LDI r2, 505
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
