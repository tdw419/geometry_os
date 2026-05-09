; DESCRIPTION: Renders a white line between points (296, 74) and (74, 251).
; PLAN: r0=296(x1), r1=74(y1), r2=74(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 74
LDI r2, 74
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
