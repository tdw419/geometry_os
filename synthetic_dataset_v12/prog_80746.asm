; DESCRIPTION: Draws a black line from (134, 63) to (488, 240).
; PLAN: r0=134(x1), r1=63(y1), r2=488(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 63
LDI r2, 488
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
