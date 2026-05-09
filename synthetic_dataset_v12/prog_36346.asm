; DESCRIPTION: Places a black line segment connecting (6, 38) to (305, 97).
; PLAN: r0=6(x1), r1=38(y1), r2=305(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 38
LDI r2, 305
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
