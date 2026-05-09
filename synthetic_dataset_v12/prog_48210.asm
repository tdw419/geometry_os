; DESCRIPTION: Places a orange line segment connecting (16, 17) to (368, 220).
; PLAN: r0=16(x1), r1=17(y1), r2=368(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 17
LDI r2, 368
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
