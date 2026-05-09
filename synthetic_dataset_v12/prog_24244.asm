; DESCRIPTION: Renders a white line between points (338, 171) and (451, 91).
; PLAN: r0=338(x1), r1=171(y1), r2=451(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 171
LDI r2, 451
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
