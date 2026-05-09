; DESCRIPTION: Places a white line segment connecting (300, 245) to (456, 186).
; PLAN: r0=300(x1), r1=245(y1), r2=456(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 245
LDI r2, 456
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
