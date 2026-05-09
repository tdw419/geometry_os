; DESCRIPTION: Draws a white line from (439, 181) to (286, 124).
; PLAN: r0=439(x1), r1=181(y1), r2=286(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 181
LDI r2, 286
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
