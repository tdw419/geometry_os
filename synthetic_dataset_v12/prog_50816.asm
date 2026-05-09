; DESCRIPTION: Draws a black line from (358, 94) to (18, 107).
; PLAN: r0=358(x1), r1=94(y1), r2=18(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 94
LDI r2, 18
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
