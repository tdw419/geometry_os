; DESCRIPTION: Renders a red line between points (109, 18) and (469, 150).
; PLAN: r0=109(x1), r1=18(y1), r2=469(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 18
LDI r2, 469
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
