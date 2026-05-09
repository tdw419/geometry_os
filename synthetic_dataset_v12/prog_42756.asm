; DESCRIPTION: Renders a black line between points (320, 119) and (130, 182).
; PLAN: r0=320(x1), r1=119(y1), r2=130(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 119
LDI r2, 130
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
