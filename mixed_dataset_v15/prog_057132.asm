; DESCRIPTION: Draws a white line from (365, 251) to (261, 54).
; PLAN: r0=365(x1), r1=251(y1), r2=261(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 251
LDI r2, 261
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
