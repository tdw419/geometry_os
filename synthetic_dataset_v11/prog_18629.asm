; DESCRIPTION: Places a red line segment connecting (77, 15) to (23, 243).
; PLAN: r0=77(x1), r1=15(y1), r2=23(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 15
LDI r2, 23
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
