; DESCRIPTION: Places a yellow line segment connecting (197, 111) to (451, 32).
; PLAN: r0=197(x1), r1=111(y1), r2=451(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 111
LDI r2, 451
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
