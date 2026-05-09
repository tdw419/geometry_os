; DESCRIPTION: Places a red line segment connecting (309, 232) to (294, 161).
; PLAN: r0=309(x1), r1=232(y1), r2=294(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 232
LDI r2, 294
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
