; DESCRIPTION: Places a black line segment connecting (90, 252) to (416, 197).
; PLAN: r0=90(x1), r1=252(y1), r2=416(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 252
LDI r2, 416
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
