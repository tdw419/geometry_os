; DESCRIPTION: Draws a white line from (23, 190) to (189, 4).
; PLAN: r0=23(x1), r1=190(y1), r2=189(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 190
LDI r2, 189
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
