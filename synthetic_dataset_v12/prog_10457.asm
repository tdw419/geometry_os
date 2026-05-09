; DESCRIPTION: Draws a white line from (31, 190) to (202, 130).
; PLAN: r0=31(x1), r1=190(y1), r2=202(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 190
LDI r2, 202
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
