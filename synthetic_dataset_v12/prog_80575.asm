; DESCRIPTION: Places a black line segment connecting (146, 3) to (101, 34).
; PLAN: r0=146(x1), r1=3(y1), r2=101(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 3
LDI r2, 101
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
