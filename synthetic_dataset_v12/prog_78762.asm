; DESCRIPTION: Places a red line segment connecting (354, 129) to (229, 49).
; PLAN: r0=354(x1), r1=129(y1), r2=229(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 129
LDI r2, 229
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
