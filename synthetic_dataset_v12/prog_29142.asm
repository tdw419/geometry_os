; DESCRIPTION: Draws a black line from (119, 243) to (396, 127).
; PLAN: r0=119(x1), r1=243(y1), r2=396(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 243
LDI r2, 396
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
