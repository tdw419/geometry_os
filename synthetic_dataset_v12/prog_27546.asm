; DESCRIPTION: Draws a yellow line from (378, 117) to (157, 166).
; PLAN: r0=378(x1), r1=117(y1), r2=157(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 117
LDI r2, 157
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
