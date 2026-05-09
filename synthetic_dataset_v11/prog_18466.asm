; DESCRIPTION: Draws a white line from (186, 98) to (47, 233).
; PLAN: r0=186(x1), r1=98(y1), r2=47(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 98
LDI r2, 47
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
