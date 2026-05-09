; DESCRIPTION: Draws a red line from (291, 129) to (47, 251).
; PLAN: r0=291(x1), r1=129(y1), r2=47(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 129
LDI r2, 47
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
