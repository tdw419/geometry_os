; DESCRIPTION: Places a red line segment connecting (0, 246) to (46, 161).
; PLAN: r0=0(x1), r1=246(y1), r2=46(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 246
LDI r2, 46
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
