; DESCRIPTION: Renders a black line between points (187, 96) and (63, 155).
; PLAN: r0=187(x1), r1=96(y1), r2=63(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 96
LDI r2, 63
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
