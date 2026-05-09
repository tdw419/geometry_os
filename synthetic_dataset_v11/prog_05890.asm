; DESCRIPTION: Places a white line segment connecting (182, 179) to (99, 169).
; PLAN: r0=182(x1), r1=179(y1), r2=99(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 179
LDI r2, 99
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
