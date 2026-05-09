; DESCRIPTION: Renders a black line between points (82, 63) and (26, 149).
; PLAN: r0=82(x1), r1=63(y1), r2=26(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 63
LDI r2, 26
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
