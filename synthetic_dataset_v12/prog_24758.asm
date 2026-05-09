; DESCRIPTION: Draws a red line from (391, 219) to (256, 145).
; PLAN: r0=391(x1), r1=219(y1), r2=256(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 219
LDI r2, 256
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
