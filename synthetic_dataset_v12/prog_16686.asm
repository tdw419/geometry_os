; DESCRIPTION: Places a black line segment connecting (62, 220) to (498, 202).
; PLAN: r0=62(x1), r1=220(y1), r2=498(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 220
LDI r2, 498
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
