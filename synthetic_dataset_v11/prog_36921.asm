; DESCRIPTION: Draws a black line from (17, 159) to (185, 173).
; PLAN: r0=17(x1), r1=159(y1), r2=185(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 159
LDI r2, 185
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
