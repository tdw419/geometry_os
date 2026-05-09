; DESCRIPTION: Draws a purple line from (140, 72) to (444, 195).
; PLAN: r0=140(x1), r1=72(y1), r2=444(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 72
LDI r2, 444
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
