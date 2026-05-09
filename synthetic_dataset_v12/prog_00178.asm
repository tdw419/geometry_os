; DESCRIPTION: Draws a black line from (0, 194) to (358, 33).
; PLAN: r0=0(x1), r1=194(y1), r2=358(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 194
LDI r2, 358
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
