; DESCRIPTION: Places a black line segment connecting (59, 84) to (411, 197).
; PLAN: r0=59(x1), r1=84(y1), r2=411(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 84
LDI r2, 411
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
