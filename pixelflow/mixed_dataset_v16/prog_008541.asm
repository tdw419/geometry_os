; DESCRIPTION: Draws a white line from (227, 228) to (451, 112).
; PLAN: r0=227(x1), r1=228(y1), r2=451(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 228
LDI r2, 451
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
