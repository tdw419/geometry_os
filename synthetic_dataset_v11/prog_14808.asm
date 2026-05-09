; DESCRIPTION: Draws a white line from (189, 219) to (71, 61).
; PLAN: r0=189(x1), r1=219(y1), r2=71(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 219
LDI r2, 71
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
