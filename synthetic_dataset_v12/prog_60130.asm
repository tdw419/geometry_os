; DESCRIPTION: Draws a white line from (94, 50) to (47, 72).
; PLAN: r0=94(x1), r1=50(y1), r2=47(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 50
LDI r2, 47
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
