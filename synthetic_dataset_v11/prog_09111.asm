; DESCRIPTION: Draws a black line from (142, 247) to (231, 133).
; PLAN: r0=142(x1), r1=247(y1), r2=231(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 247
LDI r2, 231
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
