; DESCRIPTION: Places a yellow line segment connecting (309, 122) to (360, 102).
; PLAN: r0=309(x1), r1=122(y1), r2=360(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 122
LDI r2, 360
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
