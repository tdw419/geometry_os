; DESCRIPTION: Draws a white line from (253, 229) to (163, 19).
; PLAN: r0=253(x1), r1=229(y1), r2=163(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 229
LDI r2, 163
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
