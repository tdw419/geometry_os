; DESCRIPTION: Draws a white line from (157, 70) to (486, 69).
; PLAN: r0=157(x1), r1=70(y1), r2=486(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 70
LDI r2, 486
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
