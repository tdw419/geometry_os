; DESCRIPTION: Places a white line segment connecting (35, 82) to (456, 121).
; PLAN: r0=35(x1), r1=82(y1), r2=456(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 82
LDI r2, 456
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
