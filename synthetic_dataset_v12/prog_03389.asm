; DESCRIPTION: Places a green line segment connecting (197, 141) to (313, 163).
; PLAN: r0=197(x1), r1=141(y1), r2=313(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 141
LDI r2, 313
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
