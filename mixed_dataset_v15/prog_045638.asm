; DESCRIPTION: Renders a black line between points (82, 254) and (99, 13).
; PLAN: r0=82(x1), r1=254(y1), r2=99(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 254
LDI r2, 99
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
