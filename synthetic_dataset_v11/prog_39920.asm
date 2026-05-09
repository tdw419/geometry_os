; DESCRIPTION: Places a red line segment connecting (97, 205) to (121, 121).
; PLAN: r0=97(x1), r1=205(y1), r2=121(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 205
LDI r2, 121
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
