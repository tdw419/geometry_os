; DESCRIPTION: Places a blue line segment connecting (170, 197) to (80, 103).
; PLAN: r0=170(x1), r1=197(y1), r2=80(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 197
LDI r2, 80
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
