; DESCRIPTION: Renders a black line between points (296, 145) and (446, 36).
; PLAN: r0=296(x1), r1=145(y1), r2=446(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 145
LDI r2, 446
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
