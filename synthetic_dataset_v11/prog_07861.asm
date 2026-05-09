; DESCRIPTION: Draws a white line from (228, 139) to (194, 46).
; PLAN: r0=228(x1), r1=139(y1), r2=194(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 139
LDI r2, 194
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
