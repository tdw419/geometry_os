; DESCRIPTION: Draws a purple line from (358, 255) to (488, 161).
; PLAN: r0=358(x1), r1=255(y1), r2=488(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 255
LDI r2, 488
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
