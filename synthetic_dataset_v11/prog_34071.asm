; DESCRIPTION: Renders a green line between points (190, 114) and (76, 79).
; PLAN: r0=190(x1), r1=114(y1), r2=76(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 114
LDI r2, 76
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
