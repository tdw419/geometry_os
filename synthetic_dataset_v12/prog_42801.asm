; DESCRIPTION: Places a yellow line segment connecting (150, 47) to (458, 179).
; PLAN: r0=150(x1), r1=47(y1), r2=458(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 47
LDI r2, 458
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
