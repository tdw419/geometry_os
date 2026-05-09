; DESCRIPTION: Renders a green line between points (125, 182) and (88, 79).
; PLAN: r0=125(x1), r1=182(y1), r2=88(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 182
LDI r2, 88
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
