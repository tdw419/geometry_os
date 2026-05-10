; DESCRIPTION: Places a blue line segment connecting (209, 231) to (107, 114).
; PLAN: r0=209(x1), r1=231(y1), r2=107(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 231
LDI r2, 107
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
