; DESCRIPTION: Draws a blue line from (125, 61) to (176, 101).
; PLAN: r0=125(x1), r1=61(y1), r2=176(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 61
LDI r2, 176
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
