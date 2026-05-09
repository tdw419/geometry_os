; DESCRIPTION: Places a black line segment connecting (301, 70) to (44, 38).
; PLAN: r0=301(x1), r1=70(y1), r2=44(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 70
LDI r2, 44
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
