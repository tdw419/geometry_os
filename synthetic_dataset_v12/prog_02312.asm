; DESCRIPTION: Renders a black line between points (13, 4) and (362, 40).
; PLAN: r0=13(x1), r1=4(y1), r2=362(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 4
LDI r2, 362
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
