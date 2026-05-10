; DESCRIPTION: Draws a purple line from (449, 82) to (24, 158).
; PLAN: r0=449(x1), r1=82(y1), r2=24(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 82
LDI r2, 24
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
