; DESCRIPTION: Draws a purple line from (510, 193) to (380, 70).
; PLAN: r0=510(x1), r1=193(y1), r2=380(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 193
LDI r2, 380
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
