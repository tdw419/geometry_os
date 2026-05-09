; DESCRIPTION: Draws a white line from (391, 198) to (379, 174).
; PLAN: r0=391(x1), r1=198(y1), r2=379(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 198
LDI r2, 379
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
