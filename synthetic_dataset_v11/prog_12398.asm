; DESCRIPTION: Draws a black line from (9, 11) to (143, 200).
; PLAN: r0=9(x1), r1=11(y1), r2=143(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 11
LDI r2, 143
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
