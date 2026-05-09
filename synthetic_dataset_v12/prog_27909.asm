; DESCRIPTION: Renders a black line between points (375, 160) and (165, 193).
; PLAN: r0=375(x1), r1=160(y1), r2=165(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 160
LDI r2, 165
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
