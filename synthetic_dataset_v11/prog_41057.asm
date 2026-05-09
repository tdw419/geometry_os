; DESCRIPTION: Renders a black line between points (26, 109) and (207, 62).
; PLAN: r0=26(x1), r1=109(y1), r2=207(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 109
LDI r2, 207
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
