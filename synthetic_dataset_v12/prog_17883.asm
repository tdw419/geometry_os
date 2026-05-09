; DESCRIPTION: Renders a black line between points (309, 211) and (436, 45).
; PLAN: r0=309(x1), r1=211(y1), r2=436(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 211
LDI r2, 436
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
