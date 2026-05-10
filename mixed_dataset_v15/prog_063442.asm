; DESCRIPTION: Draws a black line from (487, 216) to (287, 133).
; PLAN: r0=487(x1), r1=216(y1), r2=287(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 216
LDI r2, 287
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
