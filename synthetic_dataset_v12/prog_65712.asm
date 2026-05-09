; DESCRIPTION: Renders a black line between points (436, 217) and (488, 15).
; PLAN: r0=436(x1), r1=217(y1), r2=488(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 217
LDI r2, 488
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
