; DESCRIPTION: Draws a magenta line from (189, 251) to (427, 125).
; PLAN: r0=189(x1), r1=251(y1), r2=427(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 251
LDI r2, 427
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
