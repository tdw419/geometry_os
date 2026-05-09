; DESCRIPTION: Draws a purple line from (309, 197) to (412, 24).
; PLAN: r0=309(x1), r1=197(y1), r2=412(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 197
LDI r2, 412
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
