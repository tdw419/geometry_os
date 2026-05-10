; DESCRIPTION: Draws a purple line from (307, 153) to (338, 52).
; PLAN: r0=307(x1), r1=153(y1), r2=338(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 153
LDI r2, 338
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
