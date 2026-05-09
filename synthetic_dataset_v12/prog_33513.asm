; DESCRIPTION: Places a blue line segment connecting (0, 39) to (264, 197).
; PLAN: r0=0(x1), r1=39(y1), r2=264(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 39
LDI r2, 264
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
