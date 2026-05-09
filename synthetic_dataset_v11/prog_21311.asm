; DESCRIPTION: Renders a black line between points (36, 36) and (70, 81).
; PLAN: r0=36(x1), r1=36(y1), r2=70(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 36
LDI r2, 70
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
