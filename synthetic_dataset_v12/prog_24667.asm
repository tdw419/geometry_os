; DESCRIPTION: Renders a black line between points (430, 149) and (389, 125).
; PLAN: r0=430(x1), r1=149(y1), r2=389(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 149
LDI r2, 389
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
