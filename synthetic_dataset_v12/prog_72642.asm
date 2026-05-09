; DESCRIPTION: Draws a purple line from (178, 26) to (193, 24).
; PLAN: r0=178(x1), r1=26(y1), r2=193(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 26
LDI r2, 193
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
