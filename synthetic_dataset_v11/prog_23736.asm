; DESCRIPTION: Places a red line segment connecting (10, 83) to (228, 187).
; PLAN: r0=10(x1), r1=83(y1), r2=228(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 83
LDI r2, 228
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
