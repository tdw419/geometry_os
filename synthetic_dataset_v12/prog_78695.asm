; DESCRIPTION: Draws a white line from (8, 134) to (335, 10).
; PLAN: r0=8(x1), r1=134(y1), r2=335(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 134
LDI r2, 335
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
