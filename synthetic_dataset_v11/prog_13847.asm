; DESCRIPTION: Draws a white line from (190, 53) to (1, 251).
; PLAN: r0=190(x1), r1=53(y1), r2=1(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 53
LDI r2, 1
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
