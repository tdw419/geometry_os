; DESCRIPTION: Places a blue line segment connecting (36, 128) to (15, 197).
; PLAN: r0=36(x1), r1=128(y1), r2=15(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 128
LDI r2, 15
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
