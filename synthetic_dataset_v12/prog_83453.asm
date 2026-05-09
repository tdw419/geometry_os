; DESCRIPTION: Draws a black line from (29, 163) to (397, 181).
; PLAN: r0=29(x1), r1=163(y1), r2=397(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 163
LDI r2, 397
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
