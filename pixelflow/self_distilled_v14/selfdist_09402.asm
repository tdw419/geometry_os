; DESCRIPTION: Draws a white line from (21, 177) to (297, 54).
; PLAN: r0=21(x1), r1=177(y1), r2=297(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 177
LDI r2, 297
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
