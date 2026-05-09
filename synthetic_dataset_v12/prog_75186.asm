; DESCRIPTION: Draws a green line from (276, 246) to (97, 45).
; PLAN: r0=276(x1), r1=246(y1), r2=97(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 246
LDI r2, 97
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
