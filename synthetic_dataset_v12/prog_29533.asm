; DESCRIPTION: Draws a green line from (261, 232) to (468, 235).
; PLAN: r0=261(x1), r1=232(y1), r2=468(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 232
LDI r2, 468
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
