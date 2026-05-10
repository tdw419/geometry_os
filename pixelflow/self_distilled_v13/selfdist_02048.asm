; DESCRIPTION: Draws a white line from (78, 38) to (283, 143).
; PLAN: r0=78(x1), r1=38(y1), r2=283(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 38
LDI r2, 283
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
