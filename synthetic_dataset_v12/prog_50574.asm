; DESCRIPTION: Draws a purple line from (121, 107) to (455, 102).
; PLAN: r0=121(x1), r1=107(y1), r2=455(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 107
LDI r2, 455
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
