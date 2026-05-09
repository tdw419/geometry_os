; DESCRIPTION: Renders a black line between points (215, 198) and (163, 117).
; PLAN: r0=215(x1), r1=198(y1), r2=163(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 198
LDI r2, 163
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
