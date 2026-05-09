; DESCRIPTION: Places a yellow line segment connecting (178, 14) to (107, 254).
; PLAN: r0=178(x1), r1=14(y1), r2=107(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 14
LDI r2, 107
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
