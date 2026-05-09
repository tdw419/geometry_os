; DESCRIPTION: Places a green line segment connecting (131, 77) to (152, 117).
; PLAN: r0=131(x1), r1=77(y1), r2=152(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 77
LDI r2, 152
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
