; DESCRIPTION: Draws a purple line from (430, 215) to (366, 83).
; PLAN: r0=430(x1), r1=215(y1), r2=366(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 215
LDI r2, 366
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
