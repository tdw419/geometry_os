; DESCRIPTION: Renders a black line between points (184, 15) and (0, 107).
; PLAN: r0=184(x1), r1=15(y1), r2=0(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 15
LDI r2, 0
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
