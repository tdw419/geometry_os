; DESCRIPTION: Places a black line segment connecting (202, 190) to (54, 121).
; PLAN: r0=202(x1), r1=190(y1), r2=54(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 190
LDI r2, 54
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
