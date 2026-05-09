; DESCRIPTION: Renders a green line between points (2, 79) and (11, 122).
; PLAN: r0=2(x1), r1=79(y1), r2=11(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 79
LDI r2, 11
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
