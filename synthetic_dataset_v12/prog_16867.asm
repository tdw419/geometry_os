; DESCRIPTION: Places a blue line segment connecting (138, 111) to (176, 197).
; PLAN: r0=138(x1), r1=111(y1), r2=176(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 111
LDI r2, 176
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
