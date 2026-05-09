; DESCRIPTION: Places a red line segment connecting (90, 6) to (178, 192).
; PLAN: r0=90(x1), r1=6(y1), r2=178(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 6
LDI r2, 178
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
