; DESCRIPTION: Draws a black line from (142, 238) to (355, 128).
; PLAN: r0=142(x1), r1=238(y1), r2=355(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 238
LDI r2, 355
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
