; DESCRIPTION: Draws a white line from (134, 218) to (351, 174).
; PLAN: r0=134(x1), r1=218(y1), r2=351(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 218
LDI r2, 351
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
