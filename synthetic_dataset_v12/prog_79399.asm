; DESCRIPTION: Draws a white line from (462, 190) to (141, 8).
; PLAN: r0=462(x1), r1=190(y1), r2=141(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 190
LDI r2, 141
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
