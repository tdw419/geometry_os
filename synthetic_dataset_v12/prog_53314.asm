; DESCRIPTION: Renders a black line between points (72, 81) and (364, 243).
; PLAN: r0=72(x1), r1=81(y1), r2=364(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 81
LDI r2, 364
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
