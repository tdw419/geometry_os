; DESCRIPTION: Draws a white line from (192, 177) to (396, 34).
; PLAN: r0=192(x1), r1=177(y1), r2=396(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 177
LDI r2, 396
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
