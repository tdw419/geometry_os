; DESCRIPTION: Renders a black line between points (488, 214) and (127, 2).
; PLAN: r0=488(x1), r1=214(y1), r2=127(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 214
LDI r2, 127
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
