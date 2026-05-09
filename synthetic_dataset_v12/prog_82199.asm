; DESCRIPTION: Draws a yellow line from (358, 225) to (174, 251).
; PLAN: r0=358(x1), r1=225(y1), r2=174(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 225
LDI r2, 174
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
