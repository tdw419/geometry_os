; DESCRIPTION: Draws a black line from (332, 174) to (417, 15).
; PLAN: r0=332(x1), r1=174(y1), r2=417(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 174
LDI r2, 417
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
