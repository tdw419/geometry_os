; DESCRIPTION: Places a black line segment connecting (344, 189) to (81, 26).
; PLAN: r0=344(x1), r1=189(y1), r2=81(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 189
LDI r2, 81
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
