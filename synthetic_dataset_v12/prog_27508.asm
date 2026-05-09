; DESCRIPTION: Draws a black line from (402, 167) to (40, 39).
; PLAN: r0=402(x1), r1=167(y1), r2=40(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 167
LDI r2, 40
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
