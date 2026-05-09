; DESCRIPTION: Places a red line segment connecting (107, 82) to (14, 178).
; PLAN: r0=107(x1), r1=82(y1), r2=14(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 82
LDI r2, 14
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
