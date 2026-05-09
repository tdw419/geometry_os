; DESCRIPTION: Renders a black line between points (135, 186) and (326, 109).
; PLAN: r0=135(x1), r1=186(y1), r2=326(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 186
LDI r2, 326
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
