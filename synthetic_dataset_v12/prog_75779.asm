; DESCRIPTION: Draws a purple line from (156, 150) to (424, 114).
; PLAN: r0=156(x1), r1=150(y1), r2=424(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 150
LDI r2, 424
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
