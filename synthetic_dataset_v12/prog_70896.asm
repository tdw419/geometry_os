; DESCRIPTION: Draws a white line from (427, 167) to (279, 248).
; PLAN: r0=427(x1), r1=167(y1), r2=279(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 167
LDI r2, 279
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
