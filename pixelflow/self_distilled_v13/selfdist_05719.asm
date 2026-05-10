; DESCRIPTION: Draws a blue line from (61, 179) to (142, 193).
; PLAN: r0=61(x1), r1=179(y1), r2=142(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 179
LDI r2, 142
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
