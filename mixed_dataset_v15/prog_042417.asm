; DESCRIPTION: Renders a black line between points (496, 82) and (174, 86).
; PLAN: r0=496(x1), r1=82(y1), r2=174(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 82
LDI r2, 174
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
