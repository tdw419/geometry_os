; DESCRIPTION: Places a blue line segment connecting (362, 250) to (196, 4).
; PLAN: r0=362(x1), r1=250(y1), r2=196(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 250
LDI r2, 196
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
