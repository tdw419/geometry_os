; DESCRIPTION: Places a red line segment connecting (406, 43) to (355, 178).
; PLAN: r0=406(x1), r1=43(y1), r2=355(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 43
LDI r2, 355
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
