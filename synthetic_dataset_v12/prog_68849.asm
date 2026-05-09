; DESCRIPTION: Renders a black line between points (309, 206) and (195, 250).
; PLAN: r0=309(x1), r1=206(y1), r2=195(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 206
LDI r2, 195
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
