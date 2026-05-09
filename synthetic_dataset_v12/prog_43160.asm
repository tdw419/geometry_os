; DESCRIPTION: Draws a purple line from (90, 210) to (461, 176).
; PLAN: r0=90(x1), r1=210(y1), r2=461(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 210
LDI r2, 461
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
