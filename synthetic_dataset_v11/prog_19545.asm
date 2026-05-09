; DESCRIPTION: Renders a purple line between points (139, 79) and (218, 166).
; PLAN: r0=139(x1), r1=79(y1), r2=218(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 79
LDI r2, 218
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
