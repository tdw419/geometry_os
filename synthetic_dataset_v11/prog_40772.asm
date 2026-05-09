; DESCRIPTION: Places a orange line segment connecting (197, 222) to (179, 254).
; PLAN: r0=197(x1), r1=222(y1), r2=179(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 222
LDI r2, 179
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
