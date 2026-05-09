; DESCRIPTION: Draws a black line from (424, 176) to (89, 108).
; PLAN: r0=424(x1), r1=176(y1), r2=89(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 176
LDI r2, 89
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
