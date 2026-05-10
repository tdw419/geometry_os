; DESCRIPTION: Draws a purple line from (488, 38) to (112, 63).
; PLAN: r0=488(x1), r1=38(y1), r2=112(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 38
LDI r2, 112
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
