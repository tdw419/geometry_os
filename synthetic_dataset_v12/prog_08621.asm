; DESCRIPTION: Renders a purple line between points (447, 87) and (286, 231).
; PLAN: r0=447(x1), r1=87(y1), r2=286(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 87
LDI r2, 286
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
