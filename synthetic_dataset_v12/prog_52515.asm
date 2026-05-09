; DESCRIPTION: Places a blue line segment connecting (113, 86) to (57, 197).
; PLAN: r0=113(x1), r1=86(y1), r2=57(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 86
LDI r2, 57
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
