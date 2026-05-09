; DESCRIPTION: Draws a black line from (157, 117) to (29, 140).
; PLAN: r0=157(x1), r1=117(y1), r2=29(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 117
LDI r2, 29
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
