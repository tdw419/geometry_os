; DESCRIPTION: Renders a red line between points (109, 91) and (367, 254).
; PLAN: r0=109(x1), r1=91(y1), r2=367(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 91
LDI r2, 367
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
