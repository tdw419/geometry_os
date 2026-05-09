; DESCRIPTION: Draws a white line from (106, 253) to (314, 38).
; PLAN: r0=106(x1), r1=253(y1), r2=314(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 253
LDI r2, 314
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
