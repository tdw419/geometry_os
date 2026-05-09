; DESCRIPTION: Draws a purple line from (156, 254) to (436, 196).
; PLAN: r0=156(x1), r1=254(y1), r2=436(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 254
LDI r2, 436
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
