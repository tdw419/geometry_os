; DESCRIPTION: Renders a black line between points (362, 10) and (484, 40).
; PLAN: r0=362(x1), r1=10(y1), r2=484(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 10
LDI r2, 484
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
