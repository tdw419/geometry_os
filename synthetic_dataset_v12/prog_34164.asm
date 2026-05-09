; DESCRIPTION: Renders a white line between points (451, 73) and (440, 199).
; PLAN: r0=451(x1), r1=73(y1), r2=440(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 73
LDI r2, 440
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
