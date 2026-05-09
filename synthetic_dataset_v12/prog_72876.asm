; DESCRIPTION: Draws a white line from (285, 0) to (456, 102).
; PLAN: r0=285(x1), r1=0(y1), r2=456(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 0
LDI r2, 456
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
