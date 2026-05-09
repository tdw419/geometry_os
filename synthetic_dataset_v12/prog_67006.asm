; DESCRIPTION: Draws a blue line from (380, 201) to (322, 67).
; PLAN: r0=380(x1), r1=201(y1), r2=322(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 201
LDI r2, 322
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
