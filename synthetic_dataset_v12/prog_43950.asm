; DESCRIPTION: Draws a black line from (216, 36) to (334, 108).
; PLAN: r0=216(x1), r1=36(y1), r2=334(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 36
LDI r2, 334
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
