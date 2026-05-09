; DESCRIPTION: Renders a black line between points (91, 5) and (82, 205).
; PLAN: r0=91(x1), r1=5(y1), r2=82(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 5
LDI r2, 82
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
