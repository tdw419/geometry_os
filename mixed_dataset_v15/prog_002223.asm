; DESCRIPTION: Places a black line segment connecting (411, 197) to (326, 230).
; PLAN: r0=411(x1), r1=197(y1), r2=326(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 197
LDI r2, 326
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
