; DESCRIPTION: Renders a white line between points (471, 6) and (292, 46).
; PLAN: r0=471(x1), r1=6(y1), r2=292(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 6
LDI r2, 292
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
