; DESCRIPTION: Renders a black line between points (222, 151) and (52, 30).
; PLAN: r0=222(x1), r1=151(y1), r2=52(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 151
LDI r2, 52
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
