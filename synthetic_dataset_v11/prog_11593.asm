; DESCRIPTION: Renders a black line between points (247, 105) and (222, 46).
; PLAN: r0=247(x1), r1=105(y1), r2=222(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 105
LDI r2, 222
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
