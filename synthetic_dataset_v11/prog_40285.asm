; DESCRIPTION: Places a yellow line segment connecting (116, 243) to (227, 75).
; PLAN: r0=116(x1), r1=243(y1), r2=227(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 243
LDI r2, 227
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
