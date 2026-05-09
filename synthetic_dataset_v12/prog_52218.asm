; DESCRIPTION: Draws a purple line from (322, 123) to (422, 166).
; PLAN: r0=322(x1), r1=123(y1), r2=422(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 123
LDI r2, 422
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
