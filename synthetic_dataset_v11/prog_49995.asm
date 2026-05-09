; DESCRIPTION: Draws a purple line from (221, 126) to (153, 138).
; PLAN: r0=221(x1), r1=126(y1), r2=153(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 126
LDI r2, 153
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
