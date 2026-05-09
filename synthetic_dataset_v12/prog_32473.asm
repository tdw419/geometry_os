; DESCRIPTION: Draws a black line from (387, 136) to (124, 91).
; PLAN: r0=387(x1), r1=136(y1), r2=124(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 136
LDI r2, 124
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
