; DESCRIPTION: Draws a blue line from (362, 67) to (414, 23).
; PLAN: r0=362(x1), r1=67(y1), r2=414(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 67
LDI r2, 414
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
