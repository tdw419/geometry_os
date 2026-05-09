; DESCRIPTION: Places a black line segment connecting (158, 143) to (391, 32).
; PLAN: r0=158(x1), r1=143(y1), r2=391(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 143
LDI r2, 391
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
