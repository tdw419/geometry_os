; DESCRIPTION: Places a blue line segment connecting (240, 230) to (166, 51).
; PLAN: r0=240(x1), r1=230(y1), r2=166(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 230
LDI r2, 166
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
