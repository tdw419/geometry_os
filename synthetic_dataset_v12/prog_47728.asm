; DESCRIPTION: Renders a white line between points (309, 65) and (423, 17).
; PLAN: r0=309(x1), r1=65(y1), r2=423(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 65
LDI r2, 423
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
