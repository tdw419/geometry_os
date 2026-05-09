; DESCRIPTION: Places a blue line segment connecting (508, 104) to (267, 230).
; PLAN: r0=508(x1), r1=104(y1), r2=267(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 104
LDI r2, 267
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
