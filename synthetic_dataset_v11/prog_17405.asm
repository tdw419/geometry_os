; DESCRIPTION: Draws a purple line from (166, 202) to (101, 0).
; PLAN: r0=166(x1), r1=202(y1), r2=101(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 202
LDI r2, 101
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
