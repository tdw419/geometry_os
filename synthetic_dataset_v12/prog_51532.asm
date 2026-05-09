; DESCRIPTION: Draws a white line from (223, 218) to (30, 68).
; PLAN: r0=223(x1), r1=218(y1), r2=30(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 218
LDI r2, 30
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
