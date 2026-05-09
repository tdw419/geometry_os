; DESCRIPTION: Draws a black line from (200, 2) to (414, 37).
; PLAN: r0=200(x1), r1=2(y1), r2=414(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 2
LDI r2, 414
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
