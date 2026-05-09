; DESCRIPTION: Renders a red line between points (94, 107) and (62, 70).
; PLAN: r0=94(x1), r1=107(y1), r2=62(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 107
LDI r2, 62
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
