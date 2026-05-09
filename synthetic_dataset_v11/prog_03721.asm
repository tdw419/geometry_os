; DESCRIPTION: Renders a black line between points (1, 145) and (64, 29).
; PLAN: r0=1(x1), r1=145(y1), r2=64(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 145
LDI r2, 64
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
