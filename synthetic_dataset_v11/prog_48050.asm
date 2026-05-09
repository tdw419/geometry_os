; DESCRIPTION: Draws a red line from (99, 237) to (142, 181).
; PLAN: r0=99(x1), r1=237(y1), r2=142(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 237
LDI r2, 142
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
