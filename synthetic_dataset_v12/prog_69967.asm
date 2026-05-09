; DESCRIPTION: Renders a black line between points (497, 205) and (484, 240).
; PLAN: r0=497(x1), r1=205(y1), r2=484(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 205
LDI r2, 484
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
