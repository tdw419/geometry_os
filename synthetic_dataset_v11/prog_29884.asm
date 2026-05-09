; DESCRIPTION: Draws a purple line from (159, 124) to (215, 170).
; PLAN: r0=159(x1), r1=124(y1), r2=215(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 124
LDI r2, 215
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
