; DESCRIPTION: Renders a black line between points (264, 124) and (309, 31).
; PLAN: r0=264(x1), r1=124(y1), r2=309(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 124
LDI r2, 309
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
