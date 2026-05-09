; DESCRIPTION: Places a red line segment connecting (187, 82) to (364, 230).
; PLAN: r0=187(x1), r1=82(y1), r2=364(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 82
LDI r2, 364
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
