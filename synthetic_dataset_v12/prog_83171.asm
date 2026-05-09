; DESCRIPTION: Draws a black line from (159, 64) to (347, 5).
; PLAN: r0=159(x1), r1=64(y1), r2=347(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 64
LDI r2, 347
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
