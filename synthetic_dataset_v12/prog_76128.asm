; DESCRIPTION: Draws a black line from (90, 119) to (2, 23).
; PLAN: r0=90(x1), r1=119(y1), r2=2(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 119
LDI r2, 2
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
