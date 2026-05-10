; DESCRIPTION: Draws a purple line from (187, 91) to (232, 177).
; PLAN: r0=187(x1), r1=91(y1), r2=232(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 91
LDI r2, 232
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
