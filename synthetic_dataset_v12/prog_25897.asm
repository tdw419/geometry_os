; DESCRIPTION: Places a black line segment connecting (368, 254) to (123, 122).
; PLAN: r0=368(x1), r1=254(y1), r2=123(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 254
LDI r2, 123
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
