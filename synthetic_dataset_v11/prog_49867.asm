; DESCRIPTION: Places a black line segment connecting (22, 60) to (220, 10).
; PLAN: r0=22(x1), r1=60(y1), r2=220(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 60
LDI r2, 220
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
