; DESCRIPTION: Draws a blue line from (115, 29) to (466, 101).
; PLAN: r0=115(x1), r1=29(y1), r2=466(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 29
LDI r2, 466
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
