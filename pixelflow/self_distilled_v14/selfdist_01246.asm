; DESCRIPTION: Draws a purple line from (124, 26) to (295, 115).
; PLAN: r0=124(x1), r1=26(y1), r2=295(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 26
LDI r2, 295
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
