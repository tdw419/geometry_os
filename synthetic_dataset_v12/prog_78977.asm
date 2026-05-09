; DESCRIPTION: Draws a black line from (363, 29) to (291, 140).
; PLAN: r0=363(x1), r1=29(y1), r2=291(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 29
LDI r2, 291
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
