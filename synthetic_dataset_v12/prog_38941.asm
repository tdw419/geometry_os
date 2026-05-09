; DESCRIPTION: Renders a black line between points (413, 180) and (163, 6).
; PLAN: r0=413(x1), r1=180(y1), r2=163(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 180
LDI r2, 163
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
