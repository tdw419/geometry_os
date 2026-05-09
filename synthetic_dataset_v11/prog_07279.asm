; DESCRIPTION: Draws a white line from (186, 248) to (23, 38).
; PLAN: r0=186(x1), r1=248(y1), r2=23(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 248
LDI r2, 23
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
