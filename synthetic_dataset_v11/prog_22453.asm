; DESCRIPTION: Draws a black line from (90, 163) to (252, 22).
; PLAN: r0=90(x1), r1=163(y1), r2=252(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 163
LDI r2, 252
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
