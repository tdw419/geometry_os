; DESCRIPTION: Places a white line segment connecting (26, 255) to (309, 121).
; PLAN: r0=26(x1), r1=255(y1), r2=309(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 255
LDI r2, 309
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
