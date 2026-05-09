; DESCRIPTION: Draws a black line from (157, 183) to (391, 188).
; PLAN: r0=157(x1), r1=183(y1), r2=391(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 183
LDI r2, 391
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
