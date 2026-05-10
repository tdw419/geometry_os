; DESCRIPTION: Places a green line segment connecting (335, 46) to (118, 117).
; PLAN: r0=335(x1), r1=46(y1), r2=118(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 46
LDI r2, 118
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
