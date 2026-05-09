; DESCRIPTION: Draws a purple line from (157, 61) to (117, 94).
; PLAN: r0=157(x1), r1=61(y1), r2=117(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 61
LDI r2, 117
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
