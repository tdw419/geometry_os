; DESCRIPTION: Renders a black line between points (90, 164) and (55, 175).
; PLAN: r0=90(x1), r1=164(y1), r2=55(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 164
LDI r2, 55
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
