; DESCRIPTION: Renders a black line between points (171, 147) and (442, 243).
; PLAN: r0=171(x1), r1=147(y1), r2=442(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 147
LDI r2, 442
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
