; DESCRIPTION: Places a red line segment connecting (309, 231) to (47, 205).
; PLAN: r0=309(x1), r1=231(y1), r2=47(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 231
LDI r2, 47
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
