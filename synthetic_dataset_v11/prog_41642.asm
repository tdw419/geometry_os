; DESCRIPTION: Draws a black line from (21, 240) to (236, 140).
; PLAN: r0=21(x1), r1=240(y1), r2=236(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 240
LDI r2, 236
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
