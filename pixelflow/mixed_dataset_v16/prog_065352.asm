; DESCRIPTION: Places a blue line segment connecting (29, 51) to (362, 68).
; PLAN: r0=29(x1), r1=51(y1), r2=362(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 51
LDI r2, 362
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
