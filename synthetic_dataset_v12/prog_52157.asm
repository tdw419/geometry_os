; DESCRIPTION: Renders a white line between points (359, 232) and (106, 187).
; PLAN: r0=359(x1), r1=232(y1), r2=106(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 232
LDI r2, 106
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
