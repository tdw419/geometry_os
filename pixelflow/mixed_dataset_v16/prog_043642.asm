; DESCRIPTION: Draws a white line from (438, 204) to (436, 83).
; PLAN: r0=438(x1), r1=204(y1), r2=436(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 204
LDI r2, 436
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
