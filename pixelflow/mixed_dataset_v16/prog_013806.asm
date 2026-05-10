; DESCRIPTION: Places a black line segment connecting (362, 207) to (459, 254).
; PLAN: r0=362(x1), r1=207(y1), r2=459(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 207
LDI r2, 459
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
