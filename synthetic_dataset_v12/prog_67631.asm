; DESCRIPTION: Renders a white line between points (163, 149) and (31, 44).
; PLAN: r0=163(x1), r1=149(y1), r2=31(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 149
LDI r2, 31
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
