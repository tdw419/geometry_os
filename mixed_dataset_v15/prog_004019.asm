; DESCRIPTION: Draws a purple line from (205, 115) to (265, 61).
; PLAN: r0=205(x1), r1=115(y1), r2=265(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 115
LDI r2, 265
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
