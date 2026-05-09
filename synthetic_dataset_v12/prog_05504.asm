; DESCRIPTION: Places a black line segment connecting (197, 227) to (308, 198).
; PLAN: r0=197(x1), r1=227(y1), r2=308(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 227
LDI r2, 308
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
