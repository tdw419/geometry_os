; DESCRIPTION: Draws a white line from (71, 229) to (98, 194).
; PLAN: r0=71(x1), r1=229(y1), r2=98(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 229
LDI r2, 98
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
