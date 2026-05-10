; DESCRIPTION: Renders a black line between points (130, 208) and (237, 98).
; PLAN: r0=130(x1), r1=208(y1), r2=237(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 208
LDI r2, 237
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
