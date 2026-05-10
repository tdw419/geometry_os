; DESCRIPTION: Draws a black line from (488, 130) to (193, 110).
; PLAN: r0=488(x1), r1=130(y1), r2=193(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 130
LDI r2, 193
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
