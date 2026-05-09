; DESCRIPTION: Places a red line segment connecting (245, 107) to (115, 104).
; PLAN: r0=245(x1), r1=107(y1), r2=115(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 107
LDI r2, 115
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
