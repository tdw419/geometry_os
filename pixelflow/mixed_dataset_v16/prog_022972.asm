; DESCRIPTION: Draws a purple line from (452, 196) to (368, 63).
; PLAN: r0=452(x1), r1=196(y1), r2=368(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 196
LDI r2, 368
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
