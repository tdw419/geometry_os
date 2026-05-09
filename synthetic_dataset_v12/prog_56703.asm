; DESCRIPTION: Draws a black line from (250, 121) to (396, 150).
; PLAN: r0=250(x1), r1=121(y1), r2=396(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 121
LDI r2, 396
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
