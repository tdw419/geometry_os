; DESCRIPTION: Draws a purple line from (298, 8) to (45, 133).
; PLAN: r0=298(x1), r1=8(y1), r2=45(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 8
LDI r2, 45
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
