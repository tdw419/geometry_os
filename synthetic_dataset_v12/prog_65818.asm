; DESCRIPTION: Places a white line segment connecting (148, 221) to (47, 61).
; PLAN: r0=148(x1), r1=221(y1), r2=47(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 221
LDI r2, 47
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
