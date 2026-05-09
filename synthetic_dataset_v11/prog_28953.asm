; DESCRIPTION: Places a red line segment connecting (7, 3) to (236, 192).
; PLAN: r0=7(x1), r1=3(y1), r2=236(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 3
LDI r2, 236
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
