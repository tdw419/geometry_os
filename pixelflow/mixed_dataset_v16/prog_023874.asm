; DESCRIPTION: Draws a white line from (178, 218) to (95, 61).
; PLAN: r0=178(x1), r1=218(y1), r2=95(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 218
LDI r2, 95
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
