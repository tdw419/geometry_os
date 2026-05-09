; DESCRIPTION: Draws a white line from (198, 94) to (241, 204).
; PLAN: r0=198(x1), r1=94(y1), r2=241(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 94
LDI r2, 241
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
