; DESCRIPTION: Draws a white line from (501, 52) to (297, 139).
; PLAN: r0=501(x1), r1=52(y1), r2=297(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 52
LDI r2, 297
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
