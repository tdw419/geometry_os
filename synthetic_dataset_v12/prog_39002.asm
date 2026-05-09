; DESCRIPTION: Renders a purple line between points (504, 250) and (171, 102).
; PLAN: r0=504(x1), r1=250(y1), r2=171(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 250
LDI r2, 171
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
