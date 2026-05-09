; DESCRIPTION: Renders a black line between points (142, 103) and (117, 127).
; PLAN: r0=142(x1), r1=103(y1), r2=117(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 103
LDI r2, 117
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
