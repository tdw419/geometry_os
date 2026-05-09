; DESCRIPTION: Renders a black line between points (287, 124) and (193, 252).
; PLAN: r0=287(x1), r1=124(y1), r2=193(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 124
LDI r2, 193
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
