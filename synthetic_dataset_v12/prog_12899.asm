; DESCRIPTION: Draws a blue line from (488, 4) to (270, 13).
; PLAN: r0=488(x1), r1=4(y1), r2=270(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 4
LDI r2, 270
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
