; DESCRIPTION: Draws a purple line from (124, 208) to (329, 208).
; PLAN: r0=124(x1), r1=208(y1), r2=329(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 208
LDI r2, 329
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
