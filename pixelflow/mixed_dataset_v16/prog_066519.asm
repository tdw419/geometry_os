; DESCRIPTION: Draws a blue line from (441, 179) to (272, 240).
; PLAN: r0=441(x1), r1=179(y1), r2=272(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 179
LDI r2, 272
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
