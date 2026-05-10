; DESCRIPTION: Draws a purple line from (0, 193) to (74, 161).
; PLAN: r0=0(x1), r1=193(y1), r2=74(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 193
LDI r2, 74
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
