; DESCRIPTION: Draws a magenta line from (405, 251) to (332, 114).
; PLAN: r0=405(x1), r1=251(y1), r2=332(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 251
LDI r2, 332
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
