; DESCRIPTION: Draws a white line from (36, 211) to (159, 93).
; PLAN: r0=36(x1), r1=211(y1), r2=159(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 211
LDI r2, 159
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
